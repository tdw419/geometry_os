; DESCRIPTION: Draws a black line from (349, 14) to (466, 22).
; PLAN: r0=349(x1), r1=14(y1), r2=466(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 14
LDI r2, 466
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
