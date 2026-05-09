; DESCRIPTION: Draws a black line from (389, 35) to (461, 224).
; PLAN: r0=389(x1), r1=35(y1), r2=461(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 35
LDI r2, 461
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
