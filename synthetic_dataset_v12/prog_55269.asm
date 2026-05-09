; DESCRIPTION: Renders a green line between points (448, 216) and (290, 9).
; PLAN: r0=448(x1), r1=216(y1), r2=290(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 216
LDI r2, 290
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
