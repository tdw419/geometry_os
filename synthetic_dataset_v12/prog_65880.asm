; DESCRIPTION: Places a orange line segment connecting (176, 188) to (409, 177).
; PLAN: r0=176(x1), r1=188(y1), r2=409(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 188
LDI r2, 409
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
