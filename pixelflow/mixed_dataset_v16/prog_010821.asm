; DESCRIPTION: Places a black line segment connecting (55, 20) to (180, 199).
; PLAN: r0=55(x1), r1=20(y1), r2=180(x2), r3=199(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 20
LDI r2, 180
LDI r3, 199
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
