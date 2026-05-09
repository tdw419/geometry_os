; DESCRIPTION: Places a green line segment connecting (229, 227) to (472, 209).
; PLAN: r0=229(x1), r1=227(y1), r2=472(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 227
LDI r2, 472
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
