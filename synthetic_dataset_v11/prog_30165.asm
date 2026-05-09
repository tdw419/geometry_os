; DESCRIPTION: Renders a orange line between points (54, 117) and (90, 39).
; PLAN: r0=54(x1), r1=117(y1), r2=90(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 117
LDI r2, 90
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
