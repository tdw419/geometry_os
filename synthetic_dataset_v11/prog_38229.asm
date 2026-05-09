; DESCRIPTION: Places a green line segment connecting (211, 178) to (232, 45).
; PLAN: r0=211(x1), r1=178(y1), r2=232(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 178
LDI r2, 232
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
