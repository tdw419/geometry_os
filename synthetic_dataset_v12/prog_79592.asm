; DESCRIPTION: Draws a orange line from (7, 71) to (107, 13).
; PLAN: r0=7(x1), r1=71(y1), r2=107(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 71
LDI r2, 107
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
