; DESCRIPTION: Places a black line segment connecting (62, 252) to (392, 81).
; PLAN: r0=62(x1), r1=252(y1), r2=392(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 252
LDI r2, 392
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
