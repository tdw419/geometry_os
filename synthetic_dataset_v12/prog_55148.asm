; DESCRIPTION: Draws a black line from (130, 199) to (20, 179).
; PLAN: r0=130(x1), r1=199(y1), r2=20(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 199
LDI r2, 20
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
