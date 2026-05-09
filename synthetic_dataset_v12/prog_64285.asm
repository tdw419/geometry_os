; DESCRIPTION: Draws a orange line from (144, 142) to (342, 94).
; PLAN: r0=144(x1), r1=142(y1), r2=342(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 142
LDI r2, 342
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
