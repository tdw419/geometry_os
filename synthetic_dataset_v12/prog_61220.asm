; DESCRIPTION: Composite: Renders a magenta line between points (466, 69) and (65, 168) then Sets a single blue pixel at (423, 200) then Creates a blue circular shape at (435, 70) with radius 64.
; PLAN: r0=466(x1), r1=69(y1), r2=65(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=200(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=435(x), r11=70(y), r12=64(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 466
LDI r1, 69
LDI r2, 65
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 200
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 435
LDI r11, 70
LDI r12, 64
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
