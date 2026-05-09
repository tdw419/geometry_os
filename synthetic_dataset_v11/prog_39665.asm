; DESCRIPTION: Renders a orange line between points (32, 207) and (232, 108).
; PLAN: r0=32(x1), r1=207(y1), r2=232(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 207
LDI r2, 232
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
