; DESCRIPTION: Renders a orange line between points (117, 60) and (70, 26).
; PLAN: r0=117(x1), r1=60(y1), r2=70(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 60
LDI r2, 70
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
