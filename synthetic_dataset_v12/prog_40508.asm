; DESCRIPTION: Renders a orange line between points (338, 124) and (293, 71).
; PLAN: r0=338(x1), r1=124(y1), r2=293(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 124
LDI r2, 293
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
