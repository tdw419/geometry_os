; DESCRIPTION: Renders a green line between points (254, 95) and (332, 158).
; PLAN: r0=254(x1), r1=95(y1), r2=332(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 95
LDI r2, 332
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
