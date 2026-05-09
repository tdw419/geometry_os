; DESCRIPTION: Places a black line segment connecting (172, 120) to (25, 112).
; PLAN: r0=172(x1), r1=120(y1), r2=25(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 120
LDI r2, 25
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
