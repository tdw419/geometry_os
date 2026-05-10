; DESCRIPTION: Composite: Sets a single blue pixel at (182, 113) then Draws a orange line from (457, 0) to (275, 161) then Draws a blue circle centered at (172, 192) with radius 64.
; PLAN: r0=182(x), r1=113(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=457(x1), r6=0(y1), r7=275(x2), r8=161(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=172(x), r11=192(y), r12=64(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 182
LDI r1, 113
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 457
LDI r6, 0
LDI r7, 275
LDI r8, 161
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 192
LDI r12, 64
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
