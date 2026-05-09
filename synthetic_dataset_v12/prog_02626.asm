; DESCRIPTION: Places a green line segment connecting (232, 236) to (258, 138).
; PLAN: r0=232(x1), r1=236(y1), r2=258(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 236
LDI r2, 258
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
