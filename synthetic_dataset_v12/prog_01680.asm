; DESCRIPTION: Composite: Creates a green rectangular region at (96, 94) spanning 57 by 115 pixels then Places a magenta circle of radius 11 at center (438, 26).
; PLAN: r0=96(x), r1=94(y), r2=57(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x), r6=26(y), r7=11(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 96
LDI r1, 94
LDI r2, 57
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 26
LDI r7, 11
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
