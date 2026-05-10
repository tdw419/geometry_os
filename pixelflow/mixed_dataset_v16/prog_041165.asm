; DESCRIPTION: Renders a black line between points (206, 158) and (385, 252).
; PLAN: r0=206(x1), r1=158(y1), r2=385(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 158
LDI r2, 385
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
