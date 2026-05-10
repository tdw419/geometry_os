; DESCRIPTION: Places a green line segment connecting (8, 219) to (409, 229).
; PLAN: r0=8(x1), r1=219(y1), r2=409(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 219
LDI r2, 409
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
