; DESCRIPTION: Draws a orange line from (352, 138) to (270, 216).
; PLAN: r0=352(x1), r1=138(y1), r2=270(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 138
LDI r2, 270
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
