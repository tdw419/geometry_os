; DESCRIPTION: Places a black line segment connecting (69, 52) to (336, 180).
; PLAN: r0=69(x1), r1=52(y1), r2=336(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 52
LDI r2, 336
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
