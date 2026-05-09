; DESCRIPTION: Draws a white line from (93, 21) to (208, 245).
; PLAN: r0=93(x1), r1=21(y1), r2=208(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 21
LDI r2, 208
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
