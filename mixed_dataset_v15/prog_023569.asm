; DESCRIPTION: Renders a orange line between points (431, 141) and (400, 243).
; PLAN: r0=431(x1), r1=141(y1), r2=400(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 141
LDI r2, 400
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
