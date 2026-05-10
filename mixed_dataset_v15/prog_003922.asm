; DESCRIPTION: Draws a black line from (83, 18) to (35, 116).
; PLAN: r0=83(x1), r1=18(y1), r2=35(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 18
LDI r2, 35
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
