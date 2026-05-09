; DESCRIPTION: Renders a black line between points (376, 57) and (170, 171).
; PLAN: r0=376(x1), r1=57(y1), r2=170(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 57
LDI r2, 170
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
