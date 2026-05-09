; DESCRIPTION: Places a orange line segment connecting (287, 132) to (294, 204).
; PLAN: r0=287(x1), r1=132(y1), r2=294(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 132
LDI r2, 294
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
