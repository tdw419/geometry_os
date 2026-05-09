; DESCRIPTION: Composite: Places a magenta circle of radius 71 at center (306, 145) then Creates a purple rectangular region at (235, 97) spanning 115 by 88 pixels.
; PLAN: r0=306(x), r1=145(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=97(y), r7=115(width), r8=88(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 306
LDI r1, 145
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 97
LDI r7, 115
LDI r8, 88
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
