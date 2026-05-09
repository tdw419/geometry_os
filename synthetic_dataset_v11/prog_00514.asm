; DESCRIPTION: Draws a orange line from (44, 12) to (54, 32).
; PLAN: r0=44(x1), r1=12(y1), r2=54(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 12
LDI r2, 54
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
