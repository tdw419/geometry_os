; DESCRIPTION: Draws a orange line from (342, 23) to (473, 83).
; PLAN: r0=342(x1), r1=23(y1), r2=473(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 23
LDI r2, 473
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
