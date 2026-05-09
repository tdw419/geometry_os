; DESCRIPTION: Places a blue line segment connecting (87, 76) to (91, 26).
; PLAN: r0=87(x1), r1=76(y1), r2=91(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 76
LDI r2, 91
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
