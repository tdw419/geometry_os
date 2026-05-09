; DESCRIPTION: Places a yellow line segment connecting (307, 52) to (455, 105).
; PLAN: r0=307(x1), r1=52(y1), r2=455(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 52
LDI r2, 455
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
