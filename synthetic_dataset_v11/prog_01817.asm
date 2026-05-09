; DESCRIPTION: Renders a blue line between points (99, 219) and (117, 19).
; PLAN: r0=99(x1), r1=219(y1), r2=117(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 219
LDI r2, 117
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
