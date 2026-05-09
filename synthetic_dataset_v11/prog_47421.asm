; DESCRIPTION: Draws a orange line from (185, 119) to (213, 189).
; PLAN: r0=185(x1), r1=119(y1), r2=213(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 119
LDI r2, 213
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
