; DESCRIPTION: Composite: Creates a green rectangular region at (298, 54) spanning 89 by 73 pixels then Renders a blue disk with center (227, 25) and radius 19.
; PLAN: r0=298(x), r1=54(y), r2=89(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x), r6=25(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 298
LDI r1, 54
LDI r2, 89
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 25
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
