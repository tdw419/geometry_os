; DESCRIPTION: Draws a red line from (167, 24) to (11, 104).
; PLAN: r0=167(x1), r1=24(y1), r2=11(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 24
LDI r2, 11
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
