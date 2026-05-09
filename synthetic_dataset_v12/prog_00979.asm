; DESCRIPTION: Draws a black line from (417, 81) to (318, 96).
; PLAN: r0=417(x1), r1=81(y1), r2=318(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 81
LDI r2, 318
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
