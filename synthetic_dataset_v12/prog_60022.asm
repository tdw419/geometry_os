; DESCRIPTION: Places a magenta line segment connecting (383, 149) to (500, 205).
; PLAN: r0=383(x1), r1=149(y1), r2=500(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 149
LDI r2, 500
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
