; DESCRIPTION: Places a magenta line segment connecting (97, 205) to (503, 181).
; PLAN: r0=97(x1), r1=205(y1), r2=503(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 205
LDI r2, 503
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
