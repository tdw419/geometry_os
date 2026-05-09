; DESCRIPTION: Draws a red line from (339, 15) to (0, 129).
; PLAN: r0=339(x1), r1=15(y1), r2=0(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 15
LDI r2, 0
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
