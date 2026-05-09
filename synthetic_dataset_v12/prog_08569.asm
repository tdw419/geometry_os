; DESCRIPTION: Renders a yellow line between points (133, 189) and (398, 137).
; PLAN: r0=133(x1), r1=189(y1), r2=398(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 189
LDI r2, 398
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
