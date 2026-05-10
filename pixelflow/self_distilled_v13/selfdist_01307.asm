; DESCRIPTION: Draws a orange line from (259, 158) to (45, 86).
; PLAN: r0=259(x1), r1=158(y1), r2=45(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 158
LDI r2, 45
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
