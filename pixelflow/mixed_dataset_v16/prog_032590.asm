; DESCRIPTION: Renders a blue line between points (0, 198) and (107, 52).
; PLAN: r0=0(x1), r1=198(y1), r2=107(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 198
LDI r2, 107
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
