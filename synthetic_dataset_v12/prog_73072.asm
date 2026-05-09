; DESCRIPTION: Renders a green line between points (254, 161) and (170, 1).
; PLAN: r0=254(x1), r1=161(y1), r2=170(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 161
LDI r2, 170
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
