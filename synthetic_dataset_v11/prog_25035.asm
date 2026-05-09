; DESCRIPTION: Renders a green line between points (254, 22) and (19, 212).
; PLAN: r0=254(x1), r1=22(y1), r2=19(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 22
LDI r2, 19
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
