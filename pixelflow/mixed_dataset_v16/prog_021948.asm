; DESCRIPTION: Places a yellow line segment connecting (455, 132) to (490, 146).
; PLAN: r0=455(x1), r1=132(y1), r2=490(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 132
LDI r2, 490
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
