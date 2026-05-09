; DESCRIPTION: Draws a black line from (119, 15) to (188, 152).
; PLAN: r0=119(x1), r1=15(y1), r2=188(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 15
LDI r2, 188
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
