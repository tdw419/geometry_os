; DESCRIPTION: Places a orange line segment connecting (345, 39) to (396, 249).
; PLAN: r0=345(x1), r1=39(y1), r2=396(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 39
LDI r2, 396
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
