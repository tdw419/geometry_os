; DESCRIPTION: Places a green line segment connecting (236, 227) to (111, 234).
; PLAN: r0=236(x1), r1=227(y1), r2=111(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 227
LDI r2, 111
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
