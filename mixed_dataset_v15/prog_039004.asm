; DESCRIPTION: Draws a red line from (57, 183) to (414, 11).
; PLAN: r0=57(x1), r1=183(y1), r2=414(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 183
LDI r2, 414
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
