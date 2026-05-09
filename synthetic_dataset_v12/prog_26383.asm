; DESCRIPTION: Draws a red line from (57, 30) to (191, 245).
; PLAN: r0=57(x1), r1=30(y1), r2=191(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 30
LDI r2, 191
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
