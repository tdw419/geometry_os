; DESCRIPTION: Draws a red line from (41, 154) to (226, 102).
; PLAN: r0=41(x1), r1=154(y1), r2=226(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 154
LDI r2, 226
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
