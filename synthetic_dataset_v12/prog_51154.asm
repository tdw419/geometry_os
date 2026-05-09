; DESCRIPTION: Draws a orange line from (444, 112) to (417, 24).
; PLAN: r0=444(x1), r1=112(y1), r2=417(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 112
LDI r2, 417
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
