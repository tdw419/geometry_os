; DESCRIPTION: Places a magenta line segment connecting (97, 117) to (132, 104).
; PLAN: r0=97(x1), r1=117(y1), r2=132(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 117
LDI r2, 132
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
