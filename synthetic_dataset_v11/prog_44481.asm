; DESCRIPTION: Draws a orange line from (39, 186) to (34, 2).
; PLAN: r0=39(x1), r1=186(y1), r2=34(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 186
LDI r2, 34
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
