; DESCRIPTION: Draws a orange line from (97, 249) to (11, 120).
; PLAN: r0=97(x1), r1=249(y1), r2=11(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 249
LDI r2, 11
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
