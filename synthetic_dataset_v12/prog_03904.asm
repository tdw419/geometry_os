; DESCRIPTION: Renders a orange line between points (5, 151) and (230, 140).
; PLAN: r0=5(x1), r1=151(y1), r2=230(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 151
LDI r2, 230
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
