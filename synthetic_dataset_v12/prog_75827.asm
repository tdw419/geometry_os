; DESCRIPTION: Draws a black line from (323, 132) to (62, 47).
; PLAN: r0=323(x1), r1=132(y1), r2=62(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 132
LDI r2, 62
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
