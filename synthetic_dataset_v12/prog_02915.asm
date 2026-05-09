; DESCRIPTION: Places a green line segment connecting (457, 72) to (106, 239).
; PLAN: r0=457(x1), r1=72(y1), r2=106(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 72
LDI r2, 106
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
