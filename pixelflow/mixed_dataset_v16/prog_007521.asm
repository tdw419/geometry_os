; DESCRIPTION: Renders a black line between points (363, 123) and (275, 67).
; PLAN: r0=363(x1), r1=123(y1), r2=275(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 123
LDI r2, 275
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
