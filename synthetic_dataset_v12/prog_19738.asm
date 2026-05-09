; DESCRIPTION: Renders a orange line between points (455, 54) and (184, 121).
; PLAN: r0=455(x1), r1=54(y1), r2=184(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 54
LDI r2, 184
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
