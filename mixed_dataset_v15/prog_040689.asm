; DESCRIPTION: Places a black line segment connecting (47, 112) to (47, 55).
; PLAN: r0=47(x1), r1=112(y1), r2=47(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 112
LDI r2, 47
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
