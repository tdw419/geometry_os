; DESCRIPTION: Composite: Places a purple dot at position (133, 94) then Draws a red line from (367, 137) to (182, 161) then Renders a magenta disk with center (56, 87) and radius 18.
; PLAN: r0=133(x), r1=94(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=367(x1), r6=137(y1), r7=182(x2), r8=161(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=56(x), r11=87(y), r12=18(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 133
LDI r1, 94
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 367
LDI r6, 137
LDI r7, 182
LDI r8, 161
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 56
LDI r11, 87
LDI r12, 18
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
