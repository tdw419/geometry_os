; DESCRIPTION: Places a blue line segment connecting (167, 97) to (483, 46).
; PLAN: r0=167(x1), r1=97(y1), r2=483(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 97
LDI r2, 483
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
