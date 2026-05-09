; DESCRIPTION: Places a black line segment connecting (337, 91) to (383, 68).
; PLAN: r0=337(x1), r1=91(y1), r2=383(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 91
LDI r2, 383
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
