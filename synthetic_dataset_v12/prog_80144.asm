; DESCRIPTION: Places a green line segment connecting (283, 82) to (232, 148).
; PLAN: r0=283(x1), r1=82(y1), r2=232(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 82
LDI r2, 232
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
