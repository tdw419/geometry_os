; DESCRIPTION: Draws a white line from (15, 85) to (86, 181).
; PLAN: r0=15(x1), r1=85(y1), r2=86(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 85
LDI r2, 86
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
