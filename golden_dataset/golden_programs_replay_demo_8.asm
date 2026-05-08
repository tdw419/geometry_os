; DESCRIPTION: Display a object using color colored at the screen.

; replay_demo.asm -- Draw frames, then replay them backward
;
; Phase 38c demo: Uses SNAP_TRACE to record, FRAME to checkpoint,
; then REPLAY to display frames in reverse.
;
; Draws a vertical color bar that moves across the screen for 16 frames,
; then replays those frames backward using the REPLAY opcode.

  LDI r4, 1         ; mode = start recording
  SNAP_TRACE r4      ; begin trace recording

  LDI r12, 0         ; frame counter
  LDI r8, 16        ; total frames to draw
  LDI r13, 0         ; bar x position

draw_loop:
  ; Clear screen to black
  LDI r1, 0
  FILL r1

  ; Draw a vertical bar at position r13
  LDI r5, 0          ; y = 0
  LDI r14, 256        ; y limit
  LDI r15, 0x00FF00   ; green bar color
  LDI r0, 4          ; bar width

bar_y:
  ; Draw 4 pixels wide at (r13, r5)
  LDI r11, 0
bar_x:
  LDI r6, 0
  ADD r6, r13
  ADD r6, r11         ; x = bar_pos + offset
  SCREENP r6, r5, r15    ; set pixel
  LDI r3, 1
  ADD r11, r3
  CMP r11, r0
  BLT r2, bar_x

  LDI r3, 1
  ADD r5, r3
  CMP r5, r14
  BLT r2, bar_y

  ; Advance bar position
  LDI r3, 16
  ADD r13, r3

  ; Show frame (also triggers checkpoint since trace recording is on)
  FRAME

  LDI r3, 1
  ADD r12, r3
  CMP r12, r8
  BLT r2, draw_loop

  ; Stop recording
  LDI r4, 0
  SNAP_TRACE r4

  ; Now replay backward: show frames from newest to oldest
  LDI r9, 0         ; replay index (0 = newest)

replay_loop:
  LDI r4, 0
  ADD r4, r9        ; frame index to replay
  REPLAY r4

  ; Small delay between replay frames
  LDI r7, 0
delay:
  LDI r10, 1
  ADD r7, r10
  CMP r7, r8       ; short delay
  BLT r2, delay

  LDI r3, 1
  ADD r9, r3
  CMP r9, r8       ; replay all 16 frames
  BLT r2, replay_loop

  HALT
