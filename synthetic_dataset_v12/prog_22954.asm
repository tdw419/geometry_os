; DESCRIPTION: Renders a orange line between points (161, 55) and (333, 75).
; PLAN: r0=161(x1), r1=55(y1), r2=333(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 55
LDI r2, 333
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
