; DESCRIPTION: Places a black line segment connecting (177, 22) to (19, 76).
; PLAN: r0=177(x1), r1=22(y1), r2=19(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 22
LDI r2, 19
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
