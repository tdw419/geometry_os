; DESCRIPTION: This GeOS assembly code records and displays a vertical color bar moving across the screen for 16 frames, then replays those frames backward using the REPLAY opcode. The code utilizes SNAP_TRACE to start and stop recording, FRAME to checkpoint each frame during drawing, and SCREENP to draw pixels on the screen.

; replay_demo.asm -- Draw frames, then replay them backward
;
; Phase 38c demo: Uses SNAP_TRACE to record, FRAME to checkpoint,
; then REPLAY to display frames in reverse.
;
; Draws a vertical color bar that moves across the screen for 16 frames,
; then replays those frames backward using the REPLAY opcode.

  LDI r2, 1         ; mode = start recording
  SNAP_TRACE r2      ; begin trace recording

  LDI r3, 0         ; frame counter
  LDI r8, 16        ; total frames to draw
  LDI r9, 0         ; bar x position

draw_loop:
  ; Clear screen to black
  LDI r4, 0
  FILL r4

  ; Draw a vertical bar at position r9
  LDI r11, 0          ; y = 0
  LDI r14, 256        ; y limit
  LDI r1, 0x00FF00   ; green bar color
  LDI r10, 4          ; bar width

bar_y:
  ; Draw 4 pixels wide at (r9, r11)
  LDI r12, 0
bar_x:
  LDI r13, 0
  ADD r13, r9
  ADD r13, r12         ; x = bar_pos + offset
  SCREENP r13, r11, r1    ; set pixel
  LDI r5, 1
  ADD r12, r5
  CMP r12, r10
  BLT r6, bar_x

  LDI r5, 1
  ADD r11, r5
  CMP r11, r14
  BLT r6, bar_y

  ; Advance bar position
  LDI r5, 16
  ADD r9, r5

  ; Show frame (also triggers checkpoint since trace recording is on)
  FRAME

  LDI r5, 1
  ADD r3, r5
  CMP r3, r8
  BLT r6, draw_loop

  ; Stop recording
  LDI r2, 0
  SNAP_TRACE r2

  ; Now replay backward: show frames from newest to oldest
  LDI r0, 0         ; replay index (0 = newest)

replay_loop:
  LDI r2, 0
  ADD r2, r0        ; frame index to replay
  REPLAY r2

  ; Small delay between replay frames
  LDI r7, 0
delay:
  LDI r15, 1
  ADD r7, r15
  CMP r7, r8       ; short delay
  BLT r6, delay

  LDI r5, 1
  ADD r0, r5
  CMP r0, r8       ; replay all 16 frames
  BLT r6, replay_loop

  HALT
