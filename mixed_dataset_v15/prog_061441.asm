; DESCRIPTION: Places a black line segment connecting (219, 249) to (291, 247).
; PLAN: r0=219(x1), r1=249(y1), r2=291(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 249
LDI r2, 291
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
