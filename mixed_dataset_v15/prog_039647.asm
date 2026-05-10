; DESCRIPTION: Renders a green line segment connecting (290, 161) to (25, 149).
; PLAN: r0=290(x1), r1=161(y1), r2=25(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 161
LDI r2, 25
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
