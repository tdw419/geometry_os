; DESCRIPTION: Places a white line segment connecting (452, 93) to (349, 199).
; PLAN: r0=452(x1), r1=93(y1), r2=349(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 93
LDI r2, 349
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
