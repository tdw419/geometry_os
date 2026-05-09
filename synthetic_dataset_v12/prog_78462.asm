; DESCRIPTION: Renders a white line between points (72, 198) and (136, 149).
; PLAN: r0=72(x1), r1=198(y1), r2=136(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 198
LDI r2, 136
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
