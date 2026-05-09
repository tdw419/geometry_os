; DESCRIPTION: Draws a red line from (78, 172) to (247, 104).
; PLAN: r0=78(x1), r1=172(y1), r2=247(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 172
LDI r2, 247
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
