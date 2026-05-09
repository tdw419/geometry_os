; DESCRIPTION: Composite: Places a magenta 63x117 rectangle at position (415, 128) then Sets a single purple pixel at (192, 155).
; PLAN: r0=415(x), r1=128(y), r2=63(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x), r6=155(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 415
LDI r1, 128
LDI r2, 63
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 155
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
