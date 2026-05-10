; DESCRIPTION: Renders a yellow line between points (350, 164) and (133, 46).
; PLAN: r0=350(x1), r1=164(y1), r2=133(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 164
LDI r2, 133
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
