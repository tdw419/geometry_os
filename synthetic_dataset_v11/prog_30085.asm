; DESCRIPTION: Renders a orange line between points (243, 101) and (39, 252).
; PLAN: r0=243(x1), r1=101(y1), r2=39(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 101
LDI r2, 39
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
