; DESCRIPTION: Renders a green line between points (99, 200) and (358, 102).
; PLAN: r0=99(x1), r1=200(y1), r2=358(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 200
LDI r2, 358
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
