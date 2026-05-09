; DESCRIPTION: Places a magenta line segment connecting (412, 66) to (427, 166).
; PLAN: r0=412(x1), r1=66(y1), r2=427(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 66
LDI r2, 427
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
