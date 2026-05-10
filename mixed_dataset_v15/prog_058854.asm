; DESCRIPTION: Places a white line segment connecting (491, 24) to (321, 93).
; PLAN: r0=491(x1), r1=24(y1), r2=321(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 24
LDI r2, 321
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
