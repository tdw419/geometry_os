; DESCRIPTION: Renders a blue line between points (15, 160) and (161, 150).
; PLAN: r0=15(x1), r1=160(y1), r2=161(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 160
LDI r2, 161
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
