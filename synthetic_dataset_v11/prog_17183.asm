; DESCRIPTION: Renders a green line between points (14, 219) and (161, 155).
; PLAN: r0=14(x1), r1=219(y1), r2=161(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 219
LDI r2, 161
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
