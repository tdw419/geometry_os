; DESCRIPTION: Places a green line segment connecting (376, 76) to (178, 135).
; PLAN: r0=376(x1), r1=76(y1), r2=178(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 76
LDI r2, 178
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
