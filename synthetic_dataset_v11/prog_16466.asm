; DESCRIPTION: Draws a orange line from (87, 175) to (249, 201).
; PLAN: r0=87(x1), r1=175(y1), r2=249(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 175
LDI r2, 249
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
