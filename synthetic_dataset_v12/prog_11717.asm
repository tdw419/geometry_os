; DESCRIPTION: Draws a red line from (426, 34) to (71, 246).
; PLAN: r0=426(x1), r1=34(y1), r2=71(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 34
LDI r2, 71
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
