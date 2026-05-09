; DESCRIPTION: Places a black line segment connecting (73, 246) to (33, 167).
; PLAN: r0=73(x1), r1=246(y1), r2=33(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 246
LDI r2, 33
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
