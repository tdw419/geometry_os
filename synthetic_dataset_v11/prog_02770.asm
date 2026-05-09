; DESCRIPTION: Places a blue line segment connecting (179, 187) to (132, 26).
; PLAN: r0=179(x1), r1=187(y1), r2=132(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 187
LDI r2, 132
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
