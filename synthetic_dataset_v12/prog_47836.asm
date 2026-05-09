; DESCRIPTION: Renders a green line between points (332, 8) and (200, 2).
; PLAN: r0=332(x1), r1=8(y1), r2=200(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 8
LDI r2, 200
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
