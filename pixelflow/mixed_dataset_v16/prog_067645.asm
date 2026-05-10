; DESCRIPTION: Composite: Sets a single green pixel at (174, 0) then Draws a orange line from (3, 6) to (271, 198) then Renders a yellow disk with center (318, 114) and radius 67.
; PLAN: r0=174(x), r1=0(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=3(x1), r6=6(y1), r7=271(x2), r8=198(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=318(x), r11=114(y), r12=67(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 174
LDI r1, 0
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 3
LDI r6, 6
LDI r7, 271
LDI r8, 198
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 318
LDI r11, 114
LDI r12, 67
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
