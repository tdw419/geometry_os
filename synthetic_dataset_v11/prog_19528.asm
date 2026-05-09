; DESCRIPTION: Renders a green line between points (78, 1) and (248, 251).
; PLAN: r0=78(x1), r1=1(y1), r2=248(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 1
LDI r2, 248
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
