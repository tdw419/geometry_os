; DESCRIPTION: Places a cyan line segment connecting (293, 138) to (93, 122).
; PLAN: r0=293(x1), r1=138(y1), r2=93(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 138
LDI r2, 93
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
