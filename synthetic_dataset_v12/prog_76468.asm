; DESCRIPTION: Draws a black line from (85, 181) to (324, 21).
; PLAN: r0=85(x1), r1=181(y1), r2=324(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 181
LDI r2, 324
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
