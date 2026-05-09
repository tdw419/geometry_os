; DESCRIPTION: Draws a black line from (15, 250) to (153, 85).
; PLAN: r0=15(x1), r1=250(y1), r2=153(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 250
LDI r2, 153
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
