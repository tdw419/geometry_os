; DESCRIPTION: Composite: Sets a single blue pixel at (332, 1) then Renders a orange line between points (143, 49) and (113, 232) then Renders a white disk with center (406, 137) and radius 53.
; PLAN: r0=332(x), r1=1(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=143(x1), r6=49(y1), r7=113(x2), r8=232(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=406(x), r11=137(y), r12=53(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 332
LDI r1, 1
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 143
LDI r6, 49
LDI r7, 113
LDI r8, 232
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 137
LDI r12, 53
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
