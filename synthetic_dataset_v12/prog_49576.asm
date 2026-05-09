; DESCRIPTION: Draws a black line from (323, 20) to (65, 49).
; PLAN: r0=323(x1), r1=20(y1), r2=65(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 20
LDI r2, 65
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
