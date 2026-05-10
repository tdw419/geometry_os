; DESCRIPTION: Composite: Places a orange dot at position (406, 77) then Renders a yellow line between points (307, 33) and (87, 122) then Draws a red circle centered at (200, 115) with radius 79.
; PLAN: r0=406(x), r1=77(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=307(x1), r6=33(y1), r7=87(x2), r8=122(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=200(x), r11=115(y), r12=79(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 406
LDI r1, 77
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 307
LDI r6, 33
LDI r7, 87
LDI r8, 122
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 200
LDI r11, 115
LDI r12, 79
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
