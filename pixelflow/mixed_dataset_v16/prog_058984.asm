; DESCRIPTION: Places a black line segment connecting (69, 184) to (510, 61).
; PLAN: r0=69(x1), r1=184(y1), r2=510(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 184
LDI r2, 510
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
