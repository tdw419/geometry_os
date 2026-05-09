; DESCRIPTION: Draws a red line from (226, 41) to (341, 127).
; PLAN: r0=226(x1), r1=41(y1), r2=341(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 41
LDI r2, 341
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
