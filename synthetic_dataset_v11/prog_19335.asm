; DESCRIPTION: Renders a orange line between points (90, 105) and (196, 123).
; PLAN: r0=90(x1), r1=105(y1), r2=196(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 105
LDI r2, 196
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
