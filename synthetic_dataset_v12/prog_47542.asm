; DESCRIPTION: Draws a black line from (308, 36) to (83, 217).
; PLAN: r0=308(x1), r1=36(y1), r2=83(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 36
LDI r2, 83
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
