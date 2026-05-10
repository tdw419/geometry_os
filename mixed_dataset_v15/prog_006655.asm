; DESCRIPTION: Draws a orange line from (10, 19) to (138, 186).
; PLAN: r0=10(x1), r1=19(y1), r2=138(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 19
LDI r2, 138
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
