; DESCRIPTION: Draws a orange line from (175, 165) to (3, 44).
; PLAN: r0=175(x1), r1=165(y1), r2=3(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 165
LDI r2, 3
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
