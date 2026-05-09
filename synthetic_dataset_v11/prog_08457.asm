; DESCRIPTION: Draws a orange line from (97, 189) to (209, 187).
; PLAN: r0=97(x1), r1=189(y1), r2=209(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 189
LDI r2, 209
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
