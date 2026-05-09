; DESCRIPTION: Places a yellow line segment connecting (6, 188) to (68, 132).
; PLAN: r0=6(x1), r1=188(y1), r2=68(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 188
LDI r2, 68
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
