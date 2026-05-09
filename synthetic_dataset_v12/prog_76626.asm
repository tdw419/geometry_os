; DESCRIPTION: Draws a red line from (272, 228) to (348, 101).
; PLAN: r0=272(x1), r1=228(y1), r2=348(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 228
LDI r2, 348
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
