; DESCRIPTION: Renders a orange line between points (234, 161) and (135, 135).
; PLAN: r0=234(x1), r1=161(y1), r2=135(x2), r3=135(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 161
LDI r2, 135
LDI r3, 135
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
