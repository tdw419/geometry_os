; DESCRIPTION: Renders a orange line between points (497, 9) and (401, 160).
; PLAN: r0=497(x1), r1=9(y1), r2=401(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 9
LDI r2, 401
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
