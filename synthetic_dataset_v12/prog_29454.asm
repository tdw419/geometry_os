; DESCRIPTION: Renders a green line between points (402, 161) and (290, 185).
; PLAN: r0=402(x1), r1=161(y1), r2=290(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 161
LDI r2, 290
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
