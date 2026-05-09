; DESCRIPTION: Draws a green line from (165, 75) to (419, 245).
; PLAN: r0=165(x1), r1=75(y1), r2=419(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 75
LDI r2, 419
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
