; DESCRIPTION: Draws a orange line from (107, 147) to (442, 3).
; PLAN: r0=107(x1), r1=147(y1), r2=442(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 147
LDI r2, 442
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
