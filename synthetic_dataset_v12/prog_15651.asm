; DESCRIPTION: Places a green line segment connecting (222, 159) to (481, 3).
; PLAN: r0=222(x1), r1=159(y1), r2=481(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 159
LDI r2, 481
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
