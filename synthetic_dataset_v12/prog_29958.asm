; DESCRIPTION: Draws a red line from (6, 134) to (167, 106).
; PLAN: r0=6(x1), r1=134(y1), r2=167(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 134
LDI r2, 167
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
