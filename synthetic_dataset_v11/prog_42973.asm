; DESCRIPTION: Renders a yellow line between points (185, 0) and (250, 69).
; PLAN: r0=185(x1), r1=0(y1), r2=250(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 0
LDI r2, 250
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
