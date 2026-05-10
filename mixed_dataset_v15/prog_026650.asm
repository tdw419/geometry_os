; DESCRIPTION: Places a red line segment connecting (372, 245) to (396, 145).
; PLAN: r0=372(x1), r1=245(y1), r2=396(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 245
LDI r2, 396
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
