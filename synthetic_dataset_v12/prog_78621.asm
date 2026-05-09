; DESCRIPTION: Composite: Places a red dot at position (442, 71) then Renders a yellow disk with center (106, 75) and radius 53 then Places a orange line segment connecting (323, 162) to (412, 160).
; PLAN: r0=442(x), r1=71(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=106(x), r6=75(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=323(x1), r11=162(y1), r12=412(x2), r13=160(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 442
LDI r1, 71
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 106
LDI r6, 75
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 323
LDI r11, 162
LDI r12, 412
LDI r13, 160
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
