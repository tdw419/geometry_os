; DESCRIPTION: Renders a orange line between points (402, 87) and (391, 67).
; PLAN: r0=402(x1), r1=87(y1), r2=391(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 87
LDI r2, 391
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
