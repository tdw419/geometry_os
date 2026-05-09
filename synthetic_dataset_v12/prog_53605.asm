; DESCRIPTION: Places a green line segment connecting (383, 53) to (106, 28).
; PLAN: r0=383(x1), r1=53(y1), r2=106(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 53
LDI r2, 106
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
