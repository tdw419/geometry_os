; DESCRIPTION: Composite: Draws a magenta rectangle at (250, 2) with width 63 and height 31 then Sets a single purple pixel at (422, 83).
; PLAN: r0=250(x), r1=2(y), r2=63(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=83(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 250
LDI r1, 2
LDI r2, 63
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 83
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
