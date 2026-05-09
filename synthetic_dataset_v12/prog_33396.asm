; DESCRIPTION: Places a black line segment connecting (234, 218) to (50, 85).
; PLAN: r0=234(x1), r1=218(y1), r2=50(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 218
LDI r2, 50
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
