; DESCRIPTION: Draws a black line from (249, 74) to (62, 250).
; PLAN: r0=249(x1), r1=74(y1), r2=62(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 74
LDI r2, 62
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
