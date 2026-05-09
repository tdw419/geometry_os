; DESCRIPTION: Draws a orange line from (226, 243) to (478, 114).
; PLAN: r0=226(x1), r1=243(y1), r2=478(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 243
LDI r2, 478
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
