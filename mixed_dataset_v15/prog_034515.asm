; DESCRIPTION: Draws a orange line from (66, 26) to (319, 8).
; PLAN: r0=66(x1), r1=26(y1), r2=319(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 26
LDI r2, 319
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
