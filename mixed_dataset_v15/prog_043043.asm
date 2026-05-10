; DESCRIPTION: Composite: Creates a yellow rectangular region at (179, 106) spanning 28 by 84 pixels then Sets a single magenta pixel at (157, 225).
; PLAN: r0=179(x), r1=106(y), r2=28(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x), r6=225(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 179
LDI r1, 106
LDI r2, 28
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 225
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
