; DESCRIPTION: Renders a white line between points (78, 71) and (301, 233).
; PLAN: r0=78(x1), r1=71(y1), r2=301(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 71
LDI r2, 301
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
