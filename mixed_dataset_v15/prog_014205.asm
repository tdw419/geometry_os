; DESCRIPTION: Composite: Places a purple dot at position (221, 18) then Renders a cyan line between points (192, 153) and (138, 175) then Draws a orange circle centered at (254, 138) with radius 47.
; PLAN: r0=221(x), r1=18(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=192(x1), r6=153(y1), r7=138(x2), r8=175(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=254(x), r11=138(y), r12=47(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 221
LDI r1, 18
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 192
LDI r6, 153
LDI r7, 138
LDI r8, 175
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 254
LDI r11, 138
LDI r12, 47
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
