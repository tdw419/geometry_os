; DESCRIPTION: Composite: Renders a black line between points (135, 165) and (409, 78) then Creates a black circular shape at (91, 166) with radius 71 then Places a blue dot at position (38, 77).
; PLAN: r0=135(x1), r1=165(y1), r2=409(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=91(x), r6=166(y), r7=71(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=38(x), r11=77(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 135
LDI r1, 165
LDI r2, 409
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 166
LDI r7, 71
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 38
LDI r11, 77
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
