; DESCRIPTION: Renders a orange line between points (237, 57) and (3, 230).
; PLAN: r0=237(x1), r1=57(y1), r2=3(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 57
LDI r2, 3
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
