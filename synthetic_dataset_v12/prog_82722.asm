; DESCRIPTION: Draws a red line from (390, 166) to (411, 173).
; PLAN: r0=390(x1), r1=166(y1), r2=411(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 166
LDI r2, 411
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
