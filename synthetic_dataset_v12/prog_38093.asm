; DESCRIPTION: Places a black line segment connecting (276, 55) to (181, 33).
; PLAN: r0=276(x1), r1=55(y1), r2=181(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 55
LDI r2, 181
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
