; DESCRIPTION: Renders a orange line between points (81, 9) and (437, 16).
; PLAN: r0=81(x1), r1=9(y1), r2=437(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 9
LDI r2, 437
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
