; DESCRIPTION: Draws a orange line from (271, 6) to (74, 54).
; PLAN: r0=271(x1), r1=6(y1), r2=74(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 6
LDI r2, 74
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
