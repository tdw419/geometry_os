; DESCRIPTION: Renders a orange line between points (483, 245) and (269, 57).
; PLAN: r0=483(x1), r1=245(y1), r2=269(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 245
LDI r2, 269
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
