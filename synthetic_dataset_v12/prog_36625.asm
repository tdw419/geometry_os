; DESCRIPTION: Draws a black line from (251, 157) to (490, 212).
; PLAN: r0=251(x1), r1=157(y1), r2=490(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 157
LDI r2, 490
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
