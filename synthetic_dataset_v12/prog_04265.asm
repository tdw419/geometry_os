; DESCRIPTION: Composite: Creates a magenta rectangular region at (411, 142) spanning 86 by 110 pixels then Sets a single blue pixel at (26, 133).
; PLAN: r0=411(x), r1=142(y), r2=86(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=26(x), r6=133(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 411
LDI r1, 142
LDI r2, 86
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 133
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
