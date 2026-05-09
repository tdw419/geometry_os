; DESCRIPTION: Renders a green line between points (254, 91) and (139, 229).
; PLAN: r0=254(x1), r1=91(y1), r2=139(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 91
LDI r2, 139
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
