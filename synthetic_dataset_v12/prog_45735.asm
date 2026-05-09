; DESCRIPTION: Draws a orange line from (217, 29) to (373, 22).
; PLAN: r0=217(x1), r1=29(y1), r2=373(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 29
LDI r2, 373
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
