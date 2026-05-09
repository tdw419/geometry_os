; DESCRIPTION: Places a green line segment connecting (65, 106) to (1, 199).
; PLAN: r0=65(x1), r1=106(y1), r2=1(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 106
LDI r2, 1
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
