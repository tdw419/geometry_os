; DESCRIPTION: Composite: Renders a white line between points (288, 140) and (266, 130) then Creates a black circular shape at (84, 171) with radius 70.
; PLAN: r0=288(x1), r1=140(y1), r2=266(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=171(y), r7=70(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 288
LDI r1, 140
LDI r2, 266
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 171
LDI r7, 70
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
