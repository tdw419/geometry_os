; DESCRIPTION: Renders a orange line between points (396, 230) and (33, 139).
; PLAN: r0=396(x1), r1=230(y1), r2=33(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 230
LDI r2, 33
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
