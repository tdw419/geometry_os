; DESCRIPTION: Renders a orange line between points (80, 178) and (19, 249).
; PLAN: r0=80(x1), r1=178(y1), r2=19(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 178
LDI r2, 19
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
