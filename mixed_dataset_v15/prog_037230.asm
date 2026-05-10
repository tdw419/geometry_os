; DESCRIPTION: Composite: Places a magenta line segment connecting (34, 198) to (92, 82) then Places a orange dot at position (169, 114) then Renders a magenta disk with center (439, 95) and radius 58.
; PLAN: r0=34(x1), r1=198(y1), r2=92(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=114(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=439(x), r11=95(y), r12=58(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 34
LDI r1, 198
LDI r2, 92
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 114
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 439
LDI r11, 95
LDI r12, 58
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
