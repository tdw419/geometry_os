; DESCRIPTION: Renders a orange line between points (446, 178) and (451, 246).
; PLAN: r0=446(x1), r1=178(y1), r2=451(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 178
LDI r2, 451
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
