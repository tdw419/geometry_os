; DESCRIPTION: Places a magenta line segment connecting (261, 208) to (423, 114).
; PLAN: r0=261(x1), r1=208(y1), r2=423(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 208
LDI r2, 423
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
