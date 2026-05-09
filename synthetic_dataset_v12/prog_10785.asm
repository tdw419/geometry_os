; DESCRIPTION: Places a orange line segment connecting (337, 72) to (279, 8).
; PLAN: r0=337(x1), r1=72(y1), r2=279(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 72
LDI r2, 279
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
