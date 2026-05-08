; DESCRIPTION: Render a colored object at the screen.

; wm_drag_close.asm -- Window Manager with drag, close, and re-tiling (Phase 95)
;
; A window manager process that owns the full screen, tracks rectangular regions
; for each window, handles mouse drag on title bars, supports close buttons,
; and re-tiles remaining windows after close.
;
; Uses WINSYS (create/destroy/hittest/moveto/winfo), MOUSEQ, and WPIXEL.
;
; Controls:
;   Mouse move + click title bar = drag window
;   Click close button (red X, top-right of title bar) = close window
;   Press Q to quit
;
; ── Register Layout ──────────────────────────────────────────────
;   r9  = constant 1
;   r20 = constant 0
;   r12-r11 = window IDs (0 if closed)
;   r0 = dragging window id (0 = none)
;   r16 = drag offset X
;   r17 = drag offset Y
;   r18 = animation counter
;   r21-r23 = mouse mx, my, btn (from MOUSEQ)
;   r24 = keyboard key (from IKEY)
;   r25-r29 = scratch
; ──────────────────────────────────────────────────────────────────

; ── Constants ──
LDI r9, 1
LDI r20, 0
LDI r30, 0xFF00

; ── Store title strings in RAM ──
LDI r8, 0x2000
STRO r8, "Draw"
LDI r8, 0x2020
STRO r8, "Status"
LDI r8, 0x2040
STRO r8, "Colors"

; ── Create 3 windows ──

; Window 1 "Draw" at (16, 16), 100x80
LDI r7, 16
LDI r13, 16
LDI r3, 100
LDI r5, 80
LDI r15, 0x2000
LDI r8, 0
WINSYS r8
MOV r12, r1

; Window 2 "Status" at (136, 16), 100x80
LDI r7, 136
LDI r13, 16
LDI r3, 100
LDI r5, 80
LDI r15, 0x2020
LDI r8, 0
WINSYS r8
MOV r10, r1

; Window 3 "Colors" at (76, 110), 100x80
LDI r7, 76
LDI r13, 110
LDI r3, 100
LDI r5, 80
LDI r15, 0x2040
LDI r8, 0
WINSYS r8
MOV r11, r1

; ── Draw initial window contents ──
CALL draw_win1_content
CALL draw_win2_content
CALL draw_win3_content

; ── Drag state ──
LDI r0, 0
LDI r16, 0
LDI r17, 0
LDI r18, 0

; ══════════════════════════════════════════════════════════════════
; ── Main Loop ──
; ══════════════════════════════════════════════════════════════════
main_loop:
  FILL r20          ; clear screen to black

  ; Read mouse state
  MOUSEQ r21        ; r21=mx, r22=my, r23=btn

  ; Read keyboard
  IKEY r24
  LDI r25, 81       ; 'Q'
  CMP r24, r25
  JZ r1, quit

  ; ── Handle mouse click ──
  LDI r25, 2
  CMP r23, r25      ; btn == 2 (click)?
  BGE r1, check_drag

  ; Fresh click -- do hittest
  LDI r8, 4         ; op=4 (hittest)
  WINSYS r8         ; r1=win_id, r7=hit_type

  ; If no hit, skip
  JZ r1, no_click_action

  ; Bring clicked window to front
  LDI r8, 2         ; op=2 (bring to front)
  WINSYS r8

  ; Save hit window id for later
  MOV r28, r1       ; r28 = hit_win_id

  ; ── Get window info for close button check ──
  LDI r7, 0x9000    ; winfo dest addr
  LDI r8, 6         ; op=6 (winfo)
  WINSYS r8

  ; Read window x, y, w from winfo output
  LDI r25, 0x9000
  LOAD r25, r25     ; r25 = win_x
  LDI r26, 0x9001
  LOAD r26, r26     ; r26 = win_y
  LDI r27, 0x9002
  LOAD r27, r27     ; r27 = win_w

  ; close_x = win_x + win_w - 12
  MOV r29, r25
  ADD r29, r27
  LDI r8, 12
  SUB r29, r8       ; r29 = close_x

  ; Check if mouse is in close button area:
  ;   mx >= close_x AND mx < close_x + 10 AND my >= win_y AND my < win_y + 12

  ; Check mx >= close_x
  CMP r21, r29
  BLT r1, start_drag_check    ; mx < close_x, not on close button

  ; Check mx < close_x + 10
  MOV r8, r29
  LDI r25, 10
  ADD r8, r25       ; r8 = close_x + 10
  CMP r21, r8
  BGE r1, start_drag_check    ; mx >= close_x + 10, not on close button

  ; Check my >= win_y AND my < win_y + 12
  ; (r26 = win_y, already loaded)
  CMP r22, r26
  BLT r1, start_drag_check    ; my < win_y
  LDI r25, 12
  ADD r25, r26       ; win_y + 12
  CMP r22, r25
  BGE r1, start_drag_check    ; my >= win_y + 12

  ; ── Close button clicked! Destroy the window ──
  MOV r1, r28       ; restore hit window id
  LDI r8, 1         ; op=1 (destroy)
  WINSYS r8

  ; Clear the window id from our tracking
  CMP r12, r28
  JZ r1, closed_w1
  CMP r10, r28
  JZ r1, closed_w2
  LDI r11, 0
  JMP do_retile

closed_w1:
  LDI r12, 0
  JMP do_retile

closed_w2:
  LDI r10, 0

do_retile:
  CALL retile_windows
  JMP no_click_action

  ; ── Start drag (title bar hit, not close button) ──
start_drag_check:
  ; Re-do hittest for hit_type (r7 was overwritten by winfo)
  LDI r8, 4
  WINSYS r8          ; r1=win_id, r7=hit_type

  ; Check hit type -- title bar (1) = start drag
  LDI r25, 1
  CMP r7, r25
  JNZ r1, no_click_action

  ; Start dragging
  MOV r0, r1

  ; Get window info for drag offset
  LDI r7, 0x9000
  LDI r8, 6
  WINSYS r8

  ; drag_ox = mouse_x - win_x
  LDI r25, 0x9000
  LOAD r25, r25      ; win_x
  MOV r26, r21
  SUB r26, r25
  MOV r16, r26

  ; drag_oy = mouse_y - win_y
  LDI r25, 0x9001
  LOAD r25, r25      ; win_y
  MOV r26, r22
  SUB r26, r25
  MOV r17, r26

  JMP no_click_action

check_drag:
  ; If not dragging, skip
  JZ r0, no_click_action

  ; If button released (btn=0), stop dragging
  JZ r23, stop_drag

  ; Still dragging -- move window to mouse position
  MOV r1, r0       ; win_id
  MOV r7, r21
  SUB r7, r16       ; new_x = mx - drag_ox
  MOV r13, r22
  SUB r13, r17       ; new_y = my - drag_oy
  LDI r8, 5         ; op=5 (moveto)
  WINSYS r8

  JMP no_click_action

stop_drag:
  LDI r0, 0
  JMP no_click_action

no_click_action:

  ; ── Update animation counter (throttled) ──
  LDI r25, 0xFFE
  LOAD r26, r25     ; TICKS
  LDI r27, 7
  AND r26, r27
  JNZ r26, skip_update
  ADD r18, r9
  CALL draw_win2_content
  CALL draw_win3_content
skip_update:

  ; ── Draw all window frames ──
  JZ r12, skip_frame1
  MOV r1, r12
  CALL draw_window_frame
skip_frame1:

  JZ r10, skip_frame2
  MOV r1, r10
  CALL draw_window_frame
skip_frame2:

  JZ r11, skip_frame3
  MOV r1, r11
  CALL draw_window_frame
skip_frame3:

  FRAME
  JMP main_loop

quit:
  HALT

; ══════════════════════════════════════════════════════════════════
; ── Re-tile remaining windows ──
; ══════════════════════════════════════════════════════════════════
retile_windows:
  PUSH r31
  PUSH r1
  PUSH r7
  PUSH r13
  PUSH r3
  PUSH r5
  PUSH r15
  PUSH r8

  ; Count active windows
  LDI r3, 0
  JZ r12, ret_cnt2
  ADD r3, r9
ret_cnt2:
  JZ r10, ret_cnt3
  ADD r3, r9
ret_cnt3:
  JZ r11, ret_done_cnt
  ADD r3, r9
ret_done_cnt:

  ; If 0 windows, nothing to tile
  JZ r3, retile_done

  ; Compute tile width = 240 / count
  LDI r5, 240
  DIV r5, r3        ; r5 = tile_width
  LDI r25, 8
  MOV r15, r25       ; r15 = current_x (start at 8)

  ; Tile window 1
  JZ r12, retile_w2
  MOV r1, r12
  MOV r7, r15
  LDI r13, 16
  LDI r8, 5
  WINSYS r8
  ADD r15, r5
retile_w2:

  ; Tile window 2
  JZ r10, retile_w3
  MOV r1, r10
  MOV r7, r15
  LDI r13, 16
  LDI r8, 5
  WINSYS r8
  ADD r15, r5
retile_w3:

  ; Tile window 3
  JZ r11, retile_done
  MOV r1, r11
  MOV r7, r15
  LDI r13, 16
  LDI r8, 5
  WINSYS r8

retile_done:
  POP r8
  POP r15
  POP r5
  POP r3
  POP r13
  POP r7
  POP r1
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Draw Window Frame (title bar + border + close button) ──
; r1 = win_id
; ══════════════════════════════════════════════════════════════════
draw_window_frame:
  PUSH r31
  PUSH r1
  PUSH r7
  PUSH r13
  PUSH r3
  PUSH r5
  PUSH r15
  PUSH r8

  ; Get window info
  LDI r7, 0x9000
  LDI r8, 6         ; WINFO
  WINSYS r8
  JZ r1, frame_done  ; window not found

  ; Read winfo output
  LDI r25, 0x9000
  LOAD r13, r25      ; win_x
  LDI r25, 0x9001
  LOAD r3, r25      ; win_y
  LDI r25, 0x9002
  LOAD r5, r25      ; win_w
  LDI r25, 0x9003
  LOAD r15, r25      ; win_h

  ; ── Title bar (12px tall, dark purple) ──
  LDI r7, 0x444488
  MOV r8, r3         ; y = win_y
title_y:
  MOV r1, r13         ; x = win_x
title_x:
  PSET r1, r8, r7
  ADD r1, r9
  MOV r25, r13
  ADD r25, r5        ; x limit
  CMP r1, r25
  BLT r1, title_x
  ADD r8, r9
  LDI r25, 12
  ADD r25, r3        ; y limit (win_y + 12)
  CMP r8, r25
  BLT r1, title_y

  ; ── Close button (red 8x8 at top-right of title bar) ──
  ; Position: x = win_x + win_w - 11, y = win_y + 2
  MOV r25, r13
  ADD r25, r5
  LDI r26, 11
  SUB r25, r26       ; close_x = win_x + win_w - 11
  LDI r26, 2
  ADD r26, r3        ; close_y = win_y + 2

  LDI r7, 0xCC2222   ; red
  MOV r27, r26       ; y counter
close_y:
  MOV r1, r25        ; x counter
close_x:
  PSET r1, r27, r7
  ADD r1, r9
  MOV r28, r25
  LDI r29, 8
  ADD r28, r29
  CMP r1, r28
  BLT r1, close_x
  ADD r27, r9
  MOV r28, r26
  LDI r29, 8
  ADD r28, r29
  CMP r27, r28
  BLT r1, close_y

  ; ── Border outline (gray) ──
  LDI r7, 0x888888
  ; Left + right edges
  MOV r1, r3         ; y = win_y
border_y:
  PSET r13, r1, r7    ; left edge
  MOV r25, r13
  ADD r25, r5
  SUB r25, r9        ; right edge x
  PSET r25, r1, r7
  ADD r1, r9
  MOV r25, r3
  ADD r25, r15
  CMP r1, r25
  BLT r1, border_y

  ; Bottom edge
  MOV r1, r3
  ADD r1, r15
  SUB r1, r9         ; bottom y
  MOV r8, r13         ; x = win_x
bottom_x:
  PSET r8, r1, r7
  ADD r8, r9
  MOV r25, r13
  ADD r25, r5
  CMP r8, r25
  BLT r1, bottom_x

frame_done:
  POP r8
  POP r15
  POP r5
  POP r3
  POP r13
  POP r7
  POP r1
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Window 1 Content: Green background with H pattern ──
; ══════════════════════════════════════════════════════════════════
draw_win1_content:
  PUSH r31
  PUSH r1

  MOV r1, r12       ; win_id
  JZ r1, dw1_done

  ; Fill with dark green
  LDI r3, 0x003300
  LDI r5, 0
fill1_loop:
  LDI r8, 0
fill1_x:
  WPIXEL r1, r8, r5, r3
  ADD r8, r9
  LDI r25, 100
  CMP r8, r25
  BLT r1, fill1_x
  ADD r5, r9
  LDI r25, 80
  CMP r5, r25
  BLT r1, fill1_loop

  ; Draw a bright green H
  LDI r3, 0x00FF00
  LDI r5, 30
  LDI r8, 40
h_left:
  WPIXEL r1, r8, r5, r3
  ADD r5, r9
  LDI r25, 60
  CMP r5, r25
  BLT r1, h_left

  LDI r5, 30
  LDI r8, 50
h_right:
  WPIXEL r1, r8, r5, r3
  ADD r5, r9
  LDI r25, 60
  CMP r5, r25
  BLT r1, h_right

  LDI r5, 44
  LDI r8, 40
h_bar:
  WPIXEL r1, r8, r5, r3
  ADD r8, r9
  LDI r25, 51
  CMP r8, r25
  BLT r1, h_bar

dw1_done:
  POP r1
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Window 2 Content: Blue background with counter bar ──
; ══════════════════════════════════════════════════════════════════
draw_win2_content:
  PUSH r31
  PUSH r1

  MOV r1, r10       ; win_id
  JZ r1, dw2_done

  ; Fill with dark blue
  LDI r3, 0x000044
  LDI r5, 0
fill2_loop:
  LDI r8, 0
fill2_x:
  WPIXEL r1, r8, r5, r3
  ADD r8, r9
  LDI r25, 100
  CMP r8, r25
  BLT r1, fill2_x
  ADD r5, r9
  LDI r25, 80
  CMP r5, r25
  BLT r1, fill2_loop

  ; Draw counter bar
  LDI r3, 0xFFFFFF
  LDI r5, 40
  MOV r15, r18
  LDI r25, 90
  MOD r15, r25
  ADD r15, r9
  LDI r8, 5
bar_loop:
  CMP r8, r15
  BGE r1, bar_done
  WPIXEL r1, r8, r5, r3
  ADD r8, r9
  JMP bar_loop
bar_done:

dw2_done:
  POP r1
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Window 3 Content: Animated color stripes ──
; ══════════════════════════════════════════════════════════════════
draw_win3_content:
  PUSH r31
  PUSH r1
  PUSH r7
  PUSH r13

  MOV r1, r11       ; win_id
  JZ r1, dw3_done

  ; Get ticks for animation
  LDI r25, 0xFFE
  LOAD r26, r25     ; ticks

  ; Fill with animated stripes
  LDI r5, 0
stripe_y:
  LDI r8, 0
stripe_x:
  MOV r7, r8
  ADD r7, r26
  LDI r25, 31
  AND r7, r25
  LDI r25, 3
  MUL r7, r25
  LDI r25, 8
  SHL r7, r25
  MOV r3, r5
  LDI r13, 7
  AND r3, r13
  LDI r25, 16
  SHL r3, r25
  OR r7, r3
  MOV r3, r7

  WPIXEL r1, r8, r5, r3
  ADD r8, r9
  LDI r25, 100
  CMP r8, r25
  BLT r1, stripe_x

  ADD r5, r9
  LDI r25, 80
  CMP r5, r25
  BLT r1, stripe_y

dw3_done:
  POP r13
  POP r7
  POP r1
  POP r31
  RET
