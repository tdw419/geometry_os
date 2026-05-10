; DESCRIPTION: Places a white line segment connecting (439, 64) to (93, 93).
; PLAN: r0=439(x1), r1=64(y1), r2=93(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 64
LDI r2, 93
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
