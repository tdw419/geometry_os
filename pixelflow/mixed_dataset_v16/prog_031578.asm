; DESCRIPTION: Composite: Places a white line segment connecting (196, 22) to (185, 120) then Sets a single purple pixel at (393, 181) then Renders a blue disk with center (208, 133) and radius 59.
; PLAN: r0=196(x1), r1=22(y1), r2=185(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=393(x), r6=181(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=208(x), r11=133(y), r12=59(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 196
LDI r1, 22
LDI r2, 185
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 181
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 208
LDI r11, 133
LDI r12, 59
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
