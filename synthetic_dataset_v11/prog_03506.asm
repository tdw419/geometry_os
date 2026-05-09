; DESCRIPTION: Draws a red line from (226, 111) to (6, 104).
; PLAN: r0=226(x1), r1=111(y1), r2=6(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 111
LDI r2, 6
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
