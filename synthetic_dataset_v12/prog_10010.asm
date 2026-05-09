; DESCRIPTION: Places a white line segment connecting (454, 93) to (289, 205).
; PLAN: r0=454(x1), r1=93(y1), r2=289(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 93
LDI r2, 289
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
