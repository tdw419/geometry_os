; DESCRIPTION: Renders a orange line between points (248, 197) and (194, 19).
; PLAN: r0=248(x1), r1=197(y1), r2=194(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 197
LDI r2, 194
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
