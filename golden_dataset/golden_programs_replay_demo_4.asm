; DESCRIPTION: This GeOS assembly code records and displays a vertical color bar moving across the screen for 16 frames, then replays those frames backward using the REPLAY opcode. The code utilizes SNAP_TRACE to start and stop recording, FRAME to checkpoint each frame during drawing, and SCREENP to draw pixels on the screen.

; replay_demo.asm -- Draw frames, then replay them backward
;
; Phase 38c demo: Uses SNAP_TRACE to record, FRAME to checkpoint,
; then REPLAY to display frames in reverse.
;
; Draws a vertical color bar that moves across the screen for 16 frames,
; then replays those frames backward using the REPLAY opcode.

  LDI r8, 1         ; mode = start recording
  SNAP_TRACE r8      ; begin trace recording

  LDI r0, 0         ; frame counter
  LDI r5, 16        ; total frames to draw
  LDI r9, 0         ; bar x position

draw_loop:
  ; Clear screen to black
  LDI r7, 0
  FILL r7

  ; Draw a vertical bar at position r9
  LDI r15, 0          ; y = 0
  LDI r12, 256        ; y limit
  LDI r4, 0x00FF00   ; green bar color
  LDI r13, 4          ; bar width

bar_y:
  ; Draw 4 pixels wide at (r9, r15)
  LDI r6, 0
bar_x:
  LDI r14, 0
  ADD r14, r9
  ADD r14, r6         ; x = bar_pos + offset
  SCREENP r14, r15, r4    ; set pixel
  LDI r3, 1
  ADD r6, r3
  CMP r6, r13
  BLT r10, bar_x

  LDI r3, 1
  ADD r15, r3
  CMP r15, r12
  BLT r10, bar_y

  ; Advance bar position
  LDI r3, 16
  ADD r9, r3

  ; Show frame (also triggers checkpoint since trace recording is on)
  FRAME

  LDI r3, 1
  ADD r0, r3
  CMP r0, r5
  BLT r10, draw_loop

  ; Stop recording
  LDI r8, 0
  SNAP_TRACE r8

  ; Now replay backward: show frames from newest to oldest
  LDI r1, 0         ; replay index (0 = newest)

replay_loop:
  LDI r8, 0
  ADD r8, r1        ; frame index to replay
  REPLAY r8

  ; Small delay between replay frames
  LDI r2, 0
delay:
  LDI r11, 1
  ADD r2, r11
  CMP r2, r5       ; short delay
  BLT r10, delay

  LDI r3, 1
  ADD r1, r3
  CMP r1, r5       ; replay all 16 frames
  BLT r10, replay_loop

  HALT
