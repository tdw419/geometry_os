; DESCRIPTION: Draws a red line from (308, 2) to (413, 245).
; PLAN: r0=308(x1), r1=2(y1), r2=413(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 2
LDI r2, 413
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
