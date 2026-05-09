; DESCRIPTION: Renders a orange line between points (86, 215) and (318, 71).
; PLAN: r0=86(x1), r1=215(y1), r2=318(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 215
LDI r2, 318
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
