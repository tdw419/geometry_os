; CONCENTRIC SQUARES -- 8 nested squares alternating red-pink and cyan
; Each square shrinks by 32 pixels (16px per edge) toward center
; Colors swap each iteration for alternating pattern

LDI r0, 0            ; x position (top-left)
LDI r1, 0            ; y position (top-left)
LDI r2, 256          ; square size (width = height)
LDI r3, 0xFF0044     ; color A (red-pink)
LDI r4, 0x00CCFF     ; color B (cyan)
LDI r5, 16           ; margin per side per step
LDI r6, 32           ; total shrink per step
LDI r7, 8            ; number of squares to draw

loop:
  RECTF r0, r1, r2, r2, r3

  ; Shrink for next square
  ADD r0, r5         ; x += 16
  ADD r1, r5         ; y += 16
  SUB r2, r6         ; size -= 32

  ; Swap colors (r3 <-> r4)
  LDI r8, 0
  ADD r8, r3
  LDI r9, 0
  ADD r9, r4
  LDI r3, 0
  ADD r3, r9
  LDI r4, 0
  ADD r4, r8

  ; Decrement counter
  LDI r10, 1
  SUB r7, r10
  JNZ r7, loop

HALT
