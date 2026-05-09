; DESCRIPTION: Renders a yellow line between points (166, 35) and (200, 193).
; PLAN: r0=166(x1), r1=35(y1), r2=200(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 35
LDI r2, 200
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
