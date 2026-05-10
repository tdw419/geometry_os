; DESCRIPTION: Composite: Sets a single yellow pixel at (375, 54) then Renders a white line between points (219, 195) and (216, 181) then Draws a white circle centered at (265, 113) with radius 61.
; PLAN: r0=375(x), r1=54(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=219(x1), r6=195(y1), r7=216(x2), r8=181(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=265(x), r11=113(y), r12=61(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 375
LDI r1, 54
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 219
LDI r6, 195
LDI r7, 216
LDI r8, 181
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 113
LDI r12, 61
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
