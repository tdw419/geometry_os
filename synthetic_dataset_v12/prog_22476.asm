; DESCRIPTION: Places a green line segment connecting (9, 184) to (183, 229).
; PLAN: r0=9(x1), r1=184(y1), r2=183(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 184
LDI r2, 183
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
