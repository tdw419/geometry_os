; DESCRIPTION: Places a black line segment connecting (120, 5) to (134, 206).
; PLAN: r0=120(x1), r1=5(y1), r2=134(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 5
LDI r2, 134
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
