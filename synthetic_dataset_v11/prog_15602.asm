; DESCRIPTION: Renders a green line between points (207, 85) and (77, 77).
; PLAN: r0=207(x1), r1=85(y1), r2=77(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 85
LDI r2, 77
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
