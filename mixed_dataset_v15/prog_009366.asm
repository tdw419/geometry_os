; DESCRIPTION: Places a purple line segment connecting (307, 66) to (234, 252).
; PLAN: r0=307(x1), r1=66(y1), r2=234(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 66
LDI r2, 234
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
