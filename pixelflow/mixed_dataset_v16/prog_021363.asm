; DESCRIPTION: Composite: Places a orange dot at position (506, 227) then Renders a red disk with center (226, 157) and radius 59 then Draws a black line from (419, 65) to (106, 149).
; PLAN: r0=506(x), r1=227(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=226(x), r6=157(y), r7=59(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=419(x1), r11=65(y1), r12=106(x2), r13=149(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 506
LDI r1, 227
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 226
LDI r6, 157
LDI r7, 59
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 419
LDI r11, 65
LDI r12, 106
LDI r13, 149
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
