; DESCRIPTION: Draws a red line from (399, 65) to (278, 245).
; PLAN: r0=399(x1), r1=65(y1), r2=278(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 65
LDI r2, 278
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
