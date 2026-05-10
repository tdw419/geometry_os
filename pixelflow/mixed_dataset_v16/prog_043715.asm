; DESCRIPTION: Renders a black line between points (171, 218) and (232, 68).
; PLAN: r0=171(x1), r1=218(y1), r2=232(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 218
LDI r2, 232
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
