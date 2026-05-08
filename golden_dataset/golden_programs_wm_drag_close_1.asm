; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
;   r5  = constant 1
;   r20 = constant 0
;   r8-r3 = window IDs (0 if closed)
;   r7 = dragging window id (0 = none)
;   r16 = drag offset X
;   r17 = drag offset Y
;   r18 = animation counter
;   r21-r23 = mouse mx, my, btn (from MOUSEQ)
;   r24 = keyboard key (from IKEY)
;   r25-r29 = scratch
; ──────────────────────────────────────────────────────────────────

; ── Constants ──
LDI r5, 1
LDI r20, 0
LDI r30, 0xFF00

; ── Store title strings in RAM ──
LDI r4, 0x2000
STRO r4, "Draw"
LDI r4, 0x2020
STRO r4, "Status"
LDI r4, 0x2040
STRO r4, "Colors"

; ── Create 3 windows ──

; Window 1 "Draw" at (16, 16), 100x80
LDI r0, 16
LDI r14, 16
LDI r11, 100
LDI r13, 80
LDI r6, 0x2000
LDI r4, 0
WINSYS r4
MOV r8, r1

; Window 2 "Status" at (136, 16), 100x80
LDI r0, 136
LDI r14, 16
LDI r11, 100
LDI r13, 80
LDI r6, 0x2020
LDI r4, 0
WINSYS r4
MOV r10, r1

; Window 3 "Colors" at (76, 110), 100x80
LDI r0, 76
LDI r14, 110
LDI r11, 100
LDI r13, 80
LDI r6, 0x2040
LDI r4, 0
WINSYS r4
MOV r3, r1

; ── Draw initial window contents ──
CALL draw_win1_content
CALL draw_win2_content
CALL draw_win3_content

; ── Drag state ──
LDI r7, 0
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
  LDI r4, 4         ; op=4 (hittest)
  WINSYS r4         ; r1=win_id, r0=hit_type

  ; If no hit, skip
  JZ r1, no_click_action

  ; Bring clicked window to front
  LDI r4, 2         ; op=2 (bring to front)
  WINSYS r4

  ; Save hit window id for later
  MOV r28, r1       ; r28 = hit_win_id

  ; ── Get window info for close button check ──
  LDI r0, 0x9000    ; winfo dest addr
  LDI r4, 6         ; op=6 (winfo)
  WINSYS r4

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
  LDI r4, 12
  SUB r29, r4       ; r29 = close_x

  ; Check if mouse is in close button area:
  ;   mx >= close_x AND mx < close_x + 10 AND my >= win_y AND my < win_y + 12

  ; Check mx >= close_x
  CMP r21, r29
  BLT r1, start_drag_check    ; mx < close_x, not on close button

  ; Check mx < close_x + 10
  MOV r4, r29
  LDI r25, 10
  ADD r4, r25       ; r4 = close_x + 10
  CMP r21, r4
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
  LDI r4, 1         ; op=1 (destroy)
  WINSYS r4

  ; Clear the window id from our tracking
  CMP r8, r28
  JZ r1, closed_w1
  CMP r10, r28
  JZ r1, closed_w2
  LDI r3, 0
  JMP do_retile

closed_w1:
  LDI r8, 0
  JMP do_retile

closed_w2:
  LDI r10, 0

do_retile:
  CALL retile_windows
  JMP no_click_action

  ; ── Start drag (title bar hit, not close button) ──
start_drag_check:
  ; Re-do hittest for hit_type (r0 was overwritten by winfo)
  LDI r4, 4
  WINSYS r4          ; r1=win_id, r0=hit_type

  ; Check hit type -- title bar (1) = start drag
  LDI r25, 1
  CMP r0, r25
  JNZ r1, no_click_action

  ; Start dragging
  MOV r7, r1

  ; Get window info for drag offset
  LDI r0, 0x9000
  LDI r4, 6
  WINSYS r4

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
  JZ r7, no_click_action

  ; If button released (btn=0), stop dragging
  JZ r23, stop_drag

  ; Still dragging -- move window to mouse position
  MOV r1, r7       ; win_id
  MOV r0, r21
  SUB r0, r16       ; new_x = mx - drag_ox
  MOV r14, r22
  SUB r14, r17       ; new_y = my - drag_oy
  LDI r4, 5         ; op=5 (moveto)
  WINSYS r4

  JMP no_click_action

stop_drag:
  LDI r7, 0
  JMP no_click_action

no_click_action:

  ; ── Update animation counter (throttled) ──
  LDI r25, 0xFFE
  LOAD r26, r25     ; TICKS
  LDI r27, 7
  AND r26, r27
  JNZ r26, skip_update
  ADD r18, r5
  CALL draw_win2_content
  CALL draw_win3_content
skip_update:

  ; ── Draw all window frames ──
  JZ r8, skip_frame1
  MOV r1, r8
  CALL draw_window_frame
skip_frame1:

  JZ r10, skip_frame2
  MOV r1, r10
  CALL draw_window_frame
skip_frame2:

  JZ r3, skip_frame3
  MOV r1, r3
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
  PUSH r0
  PUSH r14
  PUSH r11
  PUSH r13
  PUSH r6
  PUSH r4

  ; Count active windows
  LDI r11, 0
  JZ r8, ret_cnt2
  ADD r11, r5
ret_cnt2:
  JZ r10, ret_cnt3
  ADD r11, r5
ret_cnt3:
  JZ r3, ret_done_cnt
  ADD r11, r5
ret_done_cnt:

  ; If 0 windows, nothing to tile
  JZ r11, retile_done

  ; Compute tile width = 240 / count
  LDI r13, 240
  DIV r13, r11        ; r13 = tile_width
  LDI r25, 8
  MOV r6, r25       ; r6 = current_x (start at 8)

  ; Tile window 1
  JZ r8, retile_w2
  MOV r1, r8
  MOV r0, r6
  LDI r14, 16
  LDI r4, 5
  WINSYS r4
  ADD r6, r13
retile_w2:

  ; Tile window 2
  JZ r10, retile_w3
  MOV r1, r10
  MOV r0, r6
  LDI r14, 16
  LDI r4, 5
  WINSYS r4
  ADD r6, r13
retile_w3:

  ; Tile window 3
  JZ r3, retile_done
  MOV r1, r3
  MOV r0, r6
  LDI r14, 16
  LDI r4, 5
  WINSYS r4

retile_done:
  POP r4
  POP r6
  POP r13
  POP r11
  POP r14
  POP r0
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
  PUSH r0
  PUSH r14
  PUSH r11
  PUSH r13
  PUSH r6
  PUSH r4

  ; Get window info
  LDI r0, 0x9000
  LDI r4, 6         ; WINFO
  WINSYS r4
  JZ r1, frame_done  ; window not found

  ; Read winfo output
  LDI r25, 0x9000
  LOAD r14, r25      ; win_x
  LDI r25, 0x9001
  LOAD r11, r25      ; win_y
  LDI r25, 0x9002
  LOAD r13, r25      ; win_w
  LDI r25, 0x9003
  LOAD r6, r25      ; win_h

  ; ── Title bar (12px tall, dark purple) ──
  LDI r0, 0x444488
  MOV r4, r11         ; y = win_y
title_y:
  MOV r1, r14         ; x = win_x
title_x:
  PSET r1, r4, r0
  ADD r1, r5
  MOV r25, r14
  ADD r25, r13        ; x limit
  CMP r1, r25
  BLT r1, title_x
  ADD r4, r5
  LDI r25, 12
  ADD r25, r11        ; y limit (win_y + 12)
  CMP r4, r25
  BLT r1, title_y

  ; ── Close button (red 8x8 at top-right of title bar) ──
  ; Position: x = win_x + win_w - 11, y = win_y + 2
  MOV r25, r14
  ADD r25, r13
  LDI r26, 11
  SUB r25, r26       ; close_x = win_x + win_w - 11
  LDI r26, 2
  ADD r26, r11        ; close_y = win_y + 2

  LDI r0, 0xCC2222   ; red
  MOV r27, r26       ; y counter
close_y:
  MOV r1, r25        ; x counter
close_x:
  PSET r1, r27, r0
  ADD r1, r5
  MOV r28, r25
  LDI r29, 8
  ADD r28, r29
  CMP r1, r28
  BLT r1, close_x
  ADD r27, r5
  MOV r28, r26
  LDI r29, 8
  ADD r28, r29
  CMP r27, r28
  BLT r1, close_y

  ; ── Border outline (gray) ──
  LDI r0, 0x888888
  ; Left + right edges
  MOV r1, r11         ; y = win_y
border_y:
  PSET r14, r1, r0    ; left edge
  MOV r25, r14
  ADD r25, r13
  SUB r25, r5        ; right edge x
  PSET r25, r1, r0
  ADD r1, r5
  MOV r25, r11
  ADD r25, r6
  CMP r1, r25
  BLT r1, border_y

  ; Bottom edge
  MOV r1, r11
  ADD r1, r6
  SUB r1, r5         ; bottom y
  MOV r4, r14         ; x = win_x
bottom_x:
  PSET r4, r1, r0
  ADD r4, r5
  MOV r25, r14
  ADD r25, r13
  CMP r4, r25
  BLT r1, bottom_x

frame_done:
  POP r4
  POP r6
  POP r13
  POP r11
  POP r14
  POP r0
  POP r1
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Window 1 Content: Green background with H pattern ──
; ══════════════════════════════════════════════════════════════════
draw_win1_content:
  PUSH r31
  PUSH r1

  MOV r1, r8       ; win_id
  JZ r1, dw1_done

  ; Fill with dark green
  LDI r11, 0x003300
  LDI r13, 0
fill1_loop:
  LDI r4, 0
fill1_x:
  WPIXEL r1, r4, r13, r11
  ADD r4, r5
  LDI r25, 100
  CMP r4, r25
  BLT r1, fill1_x
  ADD r13, r5
  LDI r25, 80
  CMP r13, r25
  BLT r1, fill1_loop

  ; Draw a bright green H
  LDI r11, 0x00FF00
  LDI r13, 30
  LDI r4, 40
h_left:
  WPIXEL r1, r4, r13, r11
  ADD r13, r5
  LDI r25, 60
  CMP r13, r25
  BLT r1, h_left

  LDI r13, 30
  LDI r4, 50
h_right:
  WPIXEL r1, r4, r13, r11
  ADD r13, r5
  LDI r25, 60
  CMP r13, r25
  BLT r1, h_right

  LDI r13, 44
  LDI r4, 40
h_bar:
  WPIXEL r1, r4, r13, r11
  ADD r4, r5
  LDI r25, 51
  CMP r4, r25
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
  LDI r11, 0x000044
  LDI r13, 0
fill2_loop:
  LDI r4, 0
fill2_x:
  WPIXEL r1, r4, r13, r11
  ADD r4, r5
  LDI r25, 100
  CMP r4, r25
  BLT r1, fill2_x
  ADD r13, r5
  LDI r25, 80
  CMP r13, r25
  BLT r1, fill2_loop

  ; Draw counter bar
  LDI r11, 0xFFFFFF
  LDI r13, 40
  MOV r6, r18
  LDI r25, 90
  MOD r6, r25
  ADD r6, r5
  LDI r4, 5
bar_loop:
  CMP r4, r6
  BGE r1, bar_done
  WPIXEL r1, r4, r13, r11
  ADD r4, r5
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
  PUSH r0
  PUSH r14

  MOV r1, r3       ; win_id
  JZ r1, dw3_done

  ; Get ticks for animation
  LDI r25, 0xFFE
  LOAD r26, r25     ; ticks

  ; Fill with animated stripes
  LDI r13, 0
stripe_y:
  LDI r4, 0
stripe_x:
  MOV r0, r4
  ADD r0, r26
  LDI r25, 31
  AND r0, r25
  LDI r25, 3
  MUL r0, r25
  LDI r25, 8
  SHL r0, r25
  MOV r11, r13
  LDI r14, 7
  AND r11, r14
  LDI r25, 16
  SHL r11, r25
  OR r0, r11
  MOV r11, r0

  WPIXEL r1, r4, r13, r11
  ADD r4, r5
  LDI r25, 100
  CMP r4, r25
  BLT r1, stripe_x

  ADD r13, r5
  LDI r25, 80
  CMP r13, r25
  BLT r1, stripe_y

dw3_done:
  POP r14
  POP r0
  POP r1
  POP r31
  RET
