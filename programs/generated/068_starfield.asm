; starfield.asm -- white dots of varying brightness on black background
; Uses LCG-style positioning to scatter stars across 256x256

; Seed values for star positions
LDI r0, 7       ; x seed
LDI r1, 13      ; y seed
LDI r2, 0       ; star counter
LDI r3, 200     ; number of stars

; We'll use a simple LCG: val = (val * 37 + 7) & 0xFF
; Separate LCGs for x and y

star_loop:
  ; Compute x position: r4 = (r0 * 37 + 7) & 0xFF
  LDI r4, 0
  ADD r4, r0
  LDI r5, 37
  MUL r4, r5
  LDI r5, 7
  ADD r4, r5
  LDI r5, 0xFF
  AND r4, r5
  LDI r0, 0
  ADD r0, r4        ; save new x seed

  ; Compute y position: r5 = (r1 * 53 + 11) & 0xFF
  LDI r5, 0
  ADD r5, r1
  LDI r6, 53
  MUL r5, r6
  LDI r6, 11
  ADD r5, r6
  LDI r6, 0xFF
  AND r5, r6
  LDI r1, 0
  ADD r1, r5        ; save new y seed

  ; Compute brightness: r6 = (r4 + r5) & 0x7F, then OR into R, G, B
  LDI r6, 0
  ADD r6, r4
  ADD r6, r5
  LDI r7, 0x7F
  AND r6, r7
  ; Add a minimum brightness of 0x40
  LDI r7, 0x40
  ADD r6, r7
  ; Clamp to 0xFF
  LDI r7, 0xFF
  AND r6, r7

  ; Build color: brightness in all 3 channels
  ; color = (r6 << 16) | (r6 << 8) | r6
  LDI r7, 0
  ADD r7, r6
  LDI r8, 8
  ; Compute r6 << 8
  LDI r9, 0
  ADD r9, r6
  MUL r9, r8
  OR r7, r9
  ; Compute r6 << 16
  LDI r9, 0
  ADD r9, r6
  LDI r10, 16
  MUL r9, r10
  OR r7, r9

  ; Draw star pixel at (r4, r5) with color r7
  PSET r4, r5, r7

  ; star counter++
  LDI r7, 1
  ADD r2, r7

  ; Check if done
  LDI r7, 0
  ADD r7, r2
  SUB r7, r3
  JZ r7, done
  JMP star_loop

done:
HALT
