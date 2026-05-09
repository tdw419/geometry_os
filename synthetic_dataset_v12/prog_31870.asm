; DESCRIPTION: Places a orange line segment connecting (78, 188) to (307, 195).
; PLAN: r0=78(x1), r1=188(y1), r2=307(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 188
LDI r2, 307
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
