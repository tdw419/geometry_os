; DESCRIPTION: Renders a orange line between points (338, 18) and (299, 37).
; PLAN: r0=338(x1), r1=18(y1), r2=299(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 18
LDI r2, 299
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
