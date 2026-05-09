; DESCRIPTION: Draws a black line from (147, 16) to (54, 94).
; PLAN: r0=147(x1), r1=16(y1), r2=54(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 16
LDI r2, 54
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
