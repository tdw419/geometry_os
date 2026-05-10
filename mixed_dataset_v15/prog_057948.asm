; DESCRIPTION: Draws a red line from (111, 177) to (65, 162).
; PLAN: r0=111(x1), r1=177(y1), r2=65(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 177
LDI r2, 65
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
