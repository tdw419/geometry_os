; DESCRIPTION: Draws a orange line from (473, 253) to (454, 70).
; PLAN: r0=473(x1), r1=253(y1), r2=454(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 253
LDI r2, 454
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
