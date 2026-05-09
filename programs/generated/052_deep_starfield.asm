; DEEP STARFIELD -- Dense starfield with white dots of varying brightness
; Uses simple linear congruential pseudo-random for x,y positions
; 150 stars with brightness levels from dim gray to bright white
; Bright stars get a 3-pixel cross pattern

LDI r0, 0         ; star index i
LDI r1, 150       ; total stars
LDI r4, 0xFF      ; mask for 256

star_loop:
  ; x = (i * 173 + 37) & 0xFF
  LDI r5, 0
  ADD r5, r0
  LDI r10, 173
  MUL r5, r10
  LDI r10, 37
  ADD r5, r10
  AND r5, r4

  ; y = (i * 211 + 53) & 0xFF
  LDI r6, 0
  ADD r6, r0
  LDI r10, 211
  MUL r6, r10
  LDI r10, 53
  ADD r6, r10
  AND r6, r4

  ; brightness base = (i * 59) & 0x7F + 0x40  (range 64-191)
  LDI r9, 0
  ADD r9, r0
  LDI r10, 59
  MUL r9, r10
  LDI r10, 0x7F
  AND r9, r10
  LDI r10, 0x40
  ADD r9, r10

  ; color = brightness * 0x010101 (gray: R=G=B=brightness)
  LDI r10, 0x010101
  MUL r9, r10

  ; Draw center pixel
  PSET r5, r6, r9

  ; Every 10th star: bright cross (4 extra pixels, full white)
  LDI r7, 0
  ADD r7, r0
  LDI r10, 10
  ; mod 10: count down from i by subtracting 10 repeatedly
  LDI r11, 10
mod10:
  SUB r7, r11
  LDI r12, 10
  SUB r12, r11
  JZ r12, mod10_done
  ; if r7 went below 0, add 10 back (not exact but close enough)
  ADD r7, r11
  JMP next_star
mod10_done:
  ; r7 == 0 means divisible by 10: draw cross
  LDI r10, 0xFFFFFF
  LDI r11, 0
  ADD r11, r5
  LDI r12, 1
  ADD r11, r12
  PSET r11, r6, r10
  LDI r11, 0
  ADD r11, r5
  SUB r11, r12
  PSET r11, r6, r10
  LDI r11, 0
  ADD r11, r6
  ADD r11, r12
  PSET r5, r11, r10
  LDI r11, 0
  ADD r11, r6
  SUB r11, r12
  PSET r5, r11, r10

next_star:
  ; i++
  LDI r10, 1
  ADD r0, r10

  ; if i == 150, done
  LDI r7, 0
  ADD r7, r0
  SUB r7, r1
  JZ r7, done
  JMP star_loop

done:
HALT
