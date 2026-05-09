; DESCRIPTION: Renders a green line between points (17, 61) and (297, 3).
; PLAN: r0=17(x1), r1=61(y1), r2=297(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 61
LDI r2, 297
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
