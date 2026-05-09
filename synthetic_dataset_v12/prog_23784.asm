; DESCRIPTION: Draws a white line from (299, 158) to (77, 245).
; PLAN: r0=299(x1), r1=158(y1), r2=77(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 158
LDI r2, 77
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
