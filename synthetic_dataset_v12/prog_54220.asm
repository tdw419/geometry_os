; DESCRIPTION: Draws a yellow line from (362, 162) to (55, 246).
; PLAN: r0=362(x1), r1=162(y1), r2=55(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 162
LDI r2, 55
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
