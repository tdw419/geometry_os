; DESCRIPTION: Renders a orange line between points (424, 216) and (412, 223).
; PLAN: r0=424(x1), r1=216(y1), r2=412(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 216
LDI r2, 412
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
