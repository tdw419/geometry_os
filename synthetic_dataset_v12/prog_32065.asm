; DESCRIPTION: Draws a red line from (289, 183) to (194, 143).
; PLAN: r0=289(x1), r1=183(y1), r2=194(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 183
LDI r2, 194
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
