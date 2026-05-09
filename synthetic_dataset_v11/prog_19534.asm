; DESCRIPTION: Renders a black line between points (9, 247) and (176, 31).
; PLAN: r0=9(x1), r1=247(y1), r2=176(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 247
LDI r2, 176
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
