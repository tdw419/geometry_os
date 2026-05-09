; DESCRIPTION: Places a green line segment connecting (427, 73) to (414, 221).
; PLAN: r0=427(x1), r1=73(y1), r2=414(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 73
LDI r2, 414
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
