; DESCRIPTION: Places a black line segment connecting (210, 76) to (43, 219).
; PLAN: r0=210(x1), r1=76(y1), r2=43(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 76
LDI r2, 43
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
