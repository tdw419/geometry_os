; DESCRIPTION: Renders a orange line between points (166, 70) and (73, 249).
; PLAN: r0=166(x1), r1=70(y1), r2=73(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 70
LDI r2, 73
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
