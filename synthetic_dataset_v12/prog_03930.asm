; DESCRIPTION: Composite: Creates a magenta rectangular region at (399, 84) spanning 60 by 25 pixels then Sets a single blue pixel at (433, 65).
; PLAN: r0=399(x), r1=84(y), r2=60(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x), r6=65(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 399
LDI r1, 84
LDI r2, 60
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 65
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
