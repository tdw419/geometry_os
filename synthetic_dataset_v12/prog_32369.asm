; DESCRIPTION: Places a black line segment connecting (396, 92) to (420, 6).
; PLAN: r0=396(x1), r1=92(y1), r2=420(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 92
LDI r2, 420
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
