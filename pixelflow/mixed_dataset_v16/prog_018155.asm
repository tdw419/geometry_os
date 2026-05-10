; DESCRIPTION: Composite: Renders a magenta box of size 116x22 starting at (275, 96) then Sets a single blue pixel at (448, 103).
; PLAN: r0=275(x), r1=96(y), r2=116(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=448(x), r6=103(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 275
LDI r1, 96
LDI r2, 116
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 103
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
