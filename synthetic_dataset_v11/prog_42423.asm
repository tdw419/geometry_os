; DESCRIPTION: Draws a orange line from (40, 126) to (144, 35).
; PLAN: r0=40(x1), r1=126(y1), r2=144(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 126
LDI r2, 144
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
