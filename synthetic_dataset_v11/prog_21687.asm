; DESCRIPTION: Places a black line segment connecting (16, 182) to (234, 227).
; PLAN: r0=16(x1), r1=182(y1), r2=234(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 182
LDI r2, 234
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
