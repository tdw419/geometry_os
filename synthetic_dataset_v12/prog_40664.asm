; DESCRIPTION: Renders a black line between points (318, 67) and (61, 138).
; PLAN: r0=318(x1), r1=67(y1), r2=61(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 67
LDI r2, 61
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
