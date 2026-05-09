; DESCRIPTION: Places a black line segment connecting (492, 246) to (34, 51).
; PLAN: r0=492(x1), r1=246(y1), r2=34(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 246
LDI r2, 34
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
