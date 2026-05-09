; DESCRIPTION: Places a magenta line segment connecting (117, 160) to (6, 66).
; PLAN: r0=117(x1), r1=160(y1), r2=6(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 160
LDI r2, 6
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
