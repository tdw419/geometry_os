; DESCRIPTION: Composite: Draws a purple circle centered at (189, 65) with radius 34 then Renders a white box of size 51x94 starting at (236, 75).
; PLAN: r0=189(x), r1=65(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x), r6=75(y), r7=51(width), r8=94(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 65
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 75
LDI r7, 51
LDI r8, 94
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
