; DESCRIPTION: Draws a red line from (90, 167) to (352, 245).
; PLAN: r0=90(x1), r1=167(y1), r2=352(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 167
LDI r2, 352
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
