; DESCRIPTION: Composite: Draws a yellow circle centered at (88, 174) with radius 71 then Places a magenta line segment connecting (1, 113) to (310, 18) then Sets a single purple pixel at (221, 254).
; PLAN: r0=88(x), r1=174(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=1(x1), r6=113(y1), r7=310(x2), r8=18(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=221(x), r11=254(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 88
LDI r1, 174
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 1
LDI r6, 113
LDI r7, 310
LDI r8, 18
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 254
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
