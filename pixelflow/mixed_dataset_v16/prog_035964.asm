; DESCRIPTION: Draws a black line from (385, 85) to (23, 99).
; PLAN: r0=385(x1), r1=85(y1), r2=23(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 85
LDI r2, 23
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
