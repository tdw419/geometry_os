; DESCRIPTION: Places a orange line segment connecting (230, 145) to (455, 105).
; PLAN: r0=230(x1), r1=145(y1), r2=455(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 145
LDI r2, 455
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
