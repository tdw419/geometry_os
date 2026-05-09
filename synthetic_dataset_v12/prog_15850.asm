; DESCRIPTION: Renders a yellow line between points (396, 91) and (510, 205).
; PLAN: r0=396(x1), r1=91(y1), r2=510(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 91
LDI r2, 510
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
