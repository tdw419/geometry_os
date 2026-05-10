; DESCRIPTION: Places a orange line segment connecting (394, 243) to (478, 101).
; PLAN: r0=394(x1), r1=243(y1), r2=478(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 243
LDI r2, 478
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
