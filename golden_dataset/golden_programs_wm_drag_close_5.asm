; DESCRIPTION: Geometry OS program to draw a colored object.

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
;   r11  = constant 1
;   r20 = constant 0
;   r2-r3 = window IDs (0 if closed)
;   r0 = dragging window id (0 = none)
;   r16 = drag offset X
;   r17 = drag offset Y
;   r18 = animation counter
;   r21-r23 = mouse mx, my, btn (from MOUSEQ)
;   r24 = keyboard key (from IKEY)
;   r25-r29 = scratch
; ──────────────────────────────────────────────────────────────────

; ── Constants ──
LDI r11, 1
LDI r20, 0
LDI r30, 0xFF00

; ── Store title strings in RAM ──
LDI r6, 0x2000
STRO r6, "Draw"
LDI r6, 0x2020
STRO r6, "Status"
LDI r6, 0x2040
STRO r6, "Colors"

; ── Create 3 windows ──

; Window 1 "Draw" at (16, 16), 100x80
LDI r7, 16
LDI r13, 16
LDI r4, 100
LDI r8, 80
LDI r14, 0x2000
LDI r6, 0
WINSYS r6
MOV r2, r15

; Window 2 "Status" at (136, 16), 100x80
LDI r7, 136
LDI r13, 16
LDI r4, 100
LDI r8, 80
LDI r14, 0x2020
LDI r6, 0
WINSYS r6
MOV r9, r15

; Window 3 "Colors" at (76, 110), 100x80
LDI r7, 76
LDI r13, 110
LDI r4, 100
LDI r8, 80
LDI r14, 0x2040
LDI r6, 0
WINSYS r6
MOV r3, r15

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
  JZ r15, quit

  ; ── Handle mouse click ──
  LDI r25, 2
  CMP r23, r25      ; btn == 2 (click)?
  BGE r15, check_drag

  ; Fresh click -- do hittest
  LDI r6, 4         ; op=4 (hittest)
  WINSYS r6         ; r15=win_id, r7=hit_type

  ; If no hit, skip
  JZ r15, no_click_action

  ; Bring clicked window to front
  LDI r6, 2         ; op=2 (bring to front)
  WINSYS r6

  ; Save hit window id for later
  MOV r28, r15       ; r28 = hit_win_id

  ; ── Get window info for close button check ──
  LDI r7, 0x9000    ; winfo dest addr
  LDI r6, 6         ; op=6 (winfo)
  WINSYS r6

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
  LDI r6, 12
  SUB r29, r6       ; r29 = close_x

  ; Check if mouse is in close button area:
  ;   mx >= close_x AND mx < close_x + 10 AND my >= win_y AND my < win_y + 12

  ; Check mx >= close_x
  CMP r21, r29
  BLT r15, start_drag_check    ; mx < close_x, not on close button

  ; Check mx < close_x + 10
  MOV r6, r29
  LDI r25, 10
  ADD r6, r25       ; r6 = close_x + 10
  CMP r21, r6
  BGE r15, start_drag_check    ; mx >= close_x + 10, not on close button

  ; Check my >= win_y AND my < win_y + 12
  ; (r26 = win_y, already loaded)
  CMP r22, r26
  BLT r15, start_drag_check    ; my < win_y
  LDI r25, 12
  ADD r25, r26       ; win_y + 12
  CMP r22, r25
  BGE r15, start_drag_check    ; my >= win_y + 12

  ; ── Close button clicked! Destroy the window ──
  MOV r15, r28       ; restore hit window id
  LDI r6, 1         ; op=1 (destroy)
  WINSYS r6

  ; Clear the window id from our tracking
  CMP r2, r28
  JZ r15, closed_w1
  CMP r9, r28
  JZ r15, closed_w2
  LDI r3, 0
  JMP do_retile

closed_w1:
  LDI r2, 0
  JMP do_retile

closed_w2:
  LDI r9, 0

do_retile:
  CALL retile_windows
  JMP no_click_action

  ; ── Start drag (title bar hit, not close button) ──
start_drag_check:
  ; Re-do hittest for hit_type (r7 was overwritten by winfo)
  LDI r6, 4
  WINSYS r6          ; r15=win_id, r7=hit_type

  ; Check hit type -- title bar (1) = start drag
  LDI r25, 1
  CMP r7, r25
  JNZ r15, no_click_action

  ; Start dragging
  MOV r0, r15

  ; Get window info for drag offset
  LDI r7, 0x9000
  LDI r6, 6
  WINSYS r6

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
  MOV r15, r0       ; win_id
  MOV r7, r21
  SUB r7, r16       ; new_x = mx - drag_ox
  MOV r13, r22
  SUB r13, r17       ; new_y = my - drag_oy
  LDI r6, 5         ; op=5 (moveto)
  WINSYS r6

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
  ADD r18, r11
  CALL draw_win2_content
  CALL draw_win3_content
skip_update:

  ; ── Draw all window frames ──
  JZ r2, skip_frame1
  MOV r15, r2
  CALL draw_window_frame
skip_frame1:

  JZ r9, skip_frame2
  MOV r15, r9
  CALL draw_window_frame
skip_frame2:

  JZ r3, skip_frame3
  MOV r15, r3
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
  PUSH r15
  PUSH r7
  PUSH r13
  PUSH r4
  PUSH r8
  PUSH r14
  PUSH r6

  ; Count active windows
  LDI r4, 0
  JZ r2, ret_cnt2
  ADD r4, r11
ret_cnt2:
  JZ r9, ret_cnt3
  ADD r4, r11
ret_cnt3:
  JZ r3, ret_done_cnt
  ADD r4, r11
ret_done_cnt:

  ; If 0 windows, nothing to tile
  JZ r4, retile_done

  ; Compute tile width = 240 / count
  LDI r8, 240
  DIV r8, r4        ; r8 = tile_width
  LDI r25, 8
  MOV r14, r25       ; r14 = current_x (start at 8)

  ; Tile window 1
  JZ r2, retile_w2
  MOV r15, r2
  MOV r7, r14
  LDI r13, 16
  LDI r6, 5
  WINSYS r6
  ADD r14, r8
retile_w2:

  ; Tile window 2
  JZ r9, retile_w3
  MOV r15, r9
  MOV r7, r14
  LDI r13, 16
  LDI r6, 5
  WINSYS r6
  ADD r14, r8
retile_w3:

  ; Tile window 3
  JZ r3, retile_done
  MOV r15, r3
  MOV r7, r14
  LDI r13, 16
  LDI r6, 5
  WINSYS r6

retile_done:
  POP r6
  POP r14
  POP r8
  POP r4
  POP r13
  POP r7
  POP r15
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Draw Window Frame (title bar + border + close button) ──
; r15 = win_id
; ══════════════════════════════════════════════════════════════════
draw_window_frame:
  PUSH r31
  PUSH r15
  PUSH r7
  PUSH r13
  PUSH r4
  PUSH r8
  PUSH r14
  PUSH r6

  ; Get window info
  LDI r7, 0x9000
  LDI r6, 6         ; WINFO
  WINSYS r6
  JZ r15, frame_done  ; window not found

  ; Read winfo output
  LDI r25, 0x9000
  LOAD r13, r25      ; win_x
  LDI r25, 0x9001
  LOAD r4, r25      ; win_y
  LDI r25, 0x9002
  LOAD r8, r25      ; win_w
  LDI r25, 0x9003
  LOAD r14, r25      ; win_h

  ; ── Title bar (12px tall, dark purple) ──
  LDI r7, 0x444488
  MOV r6, r4         ; y = win_y
title_y:
  MOV r15, r13         ; x = win_x
title_x:
  PSET r15, r6, r7
  ADD r15, r11
  MOV r25, r13
  ADD r25, r8        ; x limit
  CMP r15, r25
  BLT r15, title_x
  ADD r6, r11
  LDI r25, 12
  ADD r25, r4        ; y limit (win_y + 12)
  CMP r6, r25
  BLT r15, title_y

  ; ── Close button (red 8x8 at top-right of title bar) ──
  ; Position: x = win_x + win_w - 11, y = win_y + 2
  MOV r25, r13
  ADD r25, r8
  LDI r26, 11
  SUB r25, r26       ; close_x = win_x + win_w - 11
  LDI r26, 2
  ADD r26, r4        ; close_y = win_y + 2

  LDI r7, 0xCC2222   ; red
  MOV r27, r26       ; y counter
close_y:
  MOV r15, r25        ; x counter
close_x:
  PSET r15, r27, r7
  ADD r15, r11
  MOV r28, r25
  LDI r29, 8
  ADD r28, r29
  CMP r15, r28
  BLT r15, close_x
  ADD r27, r11
  MOV r28, r26
  LDI r29, 8
  ADD r28, r29
  CMP r27, r28
  BLT r15, close_y

  ; ── Border outline (gray) ──
  LDI r7, 0x888888
  ; Left + right edges
  MOV r15, r4         ; y = win_y
border_y:
  PSET r13, r15, r7    ; left edge
  MOV r25, r13
  ADD r25, r8
  SUB r25, r11        ; right edge x
  PSET r25, r15, r7
  ADD r15, r11
  MOV r25, r4
  ADD r25, r14
  CMP r15, r25
  BLT r15, border_y

  ; Bottom edge
  MOV r15, r4
  ADD r15, r14
  SUB r15, r11         ; bottom y
  MOV r6, r13         ; x = win_x
bottom_x:
  PSET r6, r15, r7
  ADD r6, r11
  MOV r25, r13
  ADD r25, r8
  CMP r6, r25
  BLT r15, bottom_x

frame_done:
  POP r6
  POP r14
  POP r8
  POP r4
  POP r13
  POP r7
  POP r15
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Window 1 Content: Green background with H pattern ──
; ══════════════════════════════════════════════════════════════════
draw_win1_content:
  PUSH r31
  PUSH r15

  MOV r15, r2       ; win_id
  JZ r15, dw1_done

  ; Fill with dark green
  LDI r4, 0x003300
  LDI r8, 0
fill1_loop:
  LDI r6, 0
fill1_x:
  WPIXEL r15, r6, r8, r4
  ADD r6, r11
  LDI r25, 100
  CMP r6, r25
  BLT r15, fill1_x
  ADD r8, r11
  LDI r25, 80
  CMP r8, r25
  BLT r15, fill1_loop

  ; Draw a bright green H
  LDI r4, 0x00FF00
  LDI r8, 30
  LDI r6, 40
h_left:
  WPIXEL r15, r6, r8, r4
  ADD r8, r11
  LDI r25, 60
  CMP r8, r25
  BLT r15, h_left

  LDI r8, 30
  LDI r6, 50
h_right:
  WPIXEL r15, r6, r8, r4
  ADD r8, r11
  LDI r25, 60
  CMP r8, r25
  BLT r15, h_right

  LDI r8, 44
  LDI r6, 40
h_bar:
  WPIXEL r15, r6, r8, r4
  ADD r6, r11
  LDI r25, 51
  CMP r6, r25
  BLT r15, h_bar

dw1_done:
  POP r15
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Window 2 Content: Blue background with counter bar ──
; ══════════════════════════════════════════════════════════════════
draw_win2_content:
  PUSH r31
  PUSH r15

  MOV r15, r9       ; win_id
  JZ r15, dw2_done

  ; Fill with dark blue
  LDI r4, 0x000044
  LDI r8, 0
fill2_loop:
  LDI r6, 0
fill2_x:
  WPIXEL r15, r6, r8, r4
  ADD r6, r11
  LDI r25, 100
  CMP r6, r25
  BLT r15, fill2_x
  ADD r8, r11
  LDI r25, 80
  CMP r8, r25
  BLT r15, fill2_loop

  ; Draw counter bar
  LDI r4, 0xFFFFFF
  LDI r8, 40
  MOV r14, r18
  LDI r25, 90
  MOD r14, r25
  ADD r14, r11
  LDI r6, 5
bar_loop:
  CMP r6, r14
  BGE r15, bar_done
  WPIXEL r15, r6, r8, r4
  ADD r6, r11
  JMP bar_loop
bar_done:

dw2_done:
  POP r15
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Window 3 Content: Animated color stripes ──
; ══════════════════════════════════════════════════════════════════
draw_win3_content:
  PUSH r31
  PUSH r15
  PUSH r7
  PUSH r13

  MOV r15, r3       ; win_id
  JZ r15, dw3_done

  ; Get ticks for animation
  LDI r25, 0xFFE
  LOAD r26, r25     ; ticks

  ; Fill with animated stripes
  LDI r8, 0
stripe_y:
  LDI r6, 0
stripe_x:
  MOV r7, r6
  ADD r7, r26
  LDI r25, 31
  AND r7, r25
  LDI r25, 3
  MUL r7, r25
  LDI r25, 8
  SHL r7, r25
  MOV r4, r8
  LDI r13, 7
  AND r4, r13
  LDI r25, 16
  SHL r4, r25
  OR r7, r4
  MOV r4, r7

  WPIXEL r15, r6, r8, r4
  ADD r6, r11
  LDI r25, 100
  CMP r6, r25
  BLT r15, stripe_x

  ADD r8, r11
  LDI r25, 80
  CMP r8, r25
  BLT r15, stripe_y

dw3_done:
  POP r13
  POP r7
  POP r15
  POP r31
  RET
