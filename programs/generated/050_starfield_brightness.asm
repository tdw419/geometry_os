; STARFIELD -- White dots of varying brightness on black background
; Uses prime multipliers for pseudo-random star placement
; 80 stars with brightness ranging from dim gray to bright white

LDI r0, 0         ; star index counter
LDI r1, 80        ; total stars
LDI r2, 137       ; x position multiplier (prime)
LDI r3, 97        ; y position multiplier (prime)
LDI r4, 0xFF      ; mask for mod 256
LDI r8, 1         ; constant 1

star_loop:
  ; x = (i * 137) & 0xFF
  LDI r5, 0
  ADD r5, r0
  MUL r5, r2
  AND r5, r4

  ; y = (i * 97) & 0xFF
  LDI r6, 0
  ADD r6, r0
  MUL r6, r3
  AND r6, r4

  ; brightness = ((i * 73) & 0xFF) | 0x40
  ; ensures all stars are at least dimly visible
  LDI r9, 0
  ADD r9, r0
  LDI r10, 73
  MUL r9, r10
  AND r9, r4
  LDI r10, 0x40
  OR r9, r10
  LDI r10, 0x010101
  MUL r9, r10

  ; Draw star pixel
  PSET r5, r6, r9

  ; Every 8th star: draw 3x3 block for a "bright" star
  LDI r7, 0
  ADD r7, r0
  LDI r10, 7
  AND r7, r10
  JNZ r7, next_star

  ; Draw extra pixels around bright stars (white)
  LDI r10, 0xFFFFFF
  ; pixel to the right
  LDI r11, 0
  ADD r11, r5
  ADD r11, r8
  PSET r11, r6, r10
  ; pixel below
  LDI r11, 0
  ADD r11, r6
  ADD r11, r8
  PSET r5, r11, r10
  ; pixel to the left
  LDI r11, 0
  ADD r11, r5
  SUB r11, r8
  PSET r11, r6, r10
  ; pixel above
  LDI r11, 0
  ADD r11, r6
  SUB r11, r8
  PSET r5, r11, r10

next_star:
  ; i++
  ADD r0, r8

  ; if i == 80, done
  LDI r7, 0
  ADD r7, r0
  SUB r7, r1
  JZ r7, done
  JMP star_loop

done:
HALT
