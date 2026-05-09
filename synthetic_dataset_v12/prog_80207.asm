; DESCRIPTION: Places a black line segment connecting (172, 38) to (177, 28).
; PLAN: r0=172(x1), r1=38(y1), r2=177(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 38
LDI r2, 177
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
