; DESCRIPTION: Renders a orange line between points (455, 161) and (204, 180).
; PLAN: r0=455(x1), r1=161(y1), r2=204(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 161
LDI r2, 204
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
