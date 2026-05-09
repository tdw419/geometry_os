; DESCRIPTION: Draws a orange line from (364, 120) to (6, 59).
; PLAN: r0=364(x1), r1=120(y1), r2=6(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 120
LDI r2, 6
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
