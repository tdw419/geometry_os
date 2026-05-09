; DESCRIPTION: Draws a red line from (114, 166) to (292, 91).
; PLAN: r0=114(x1), r1=166(y1), r2=292(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 166
LDI r2, 292
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
