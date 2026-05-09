; DESCRIPTION: Places a orange line segment connecting (441, 252) to (284, 97).
; PLAN: r0=441(x1), r1=252(y1), r2=284(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 252
LDI r2, 284
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
