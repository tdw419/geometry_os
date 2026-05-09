; DESCRIPTION: Draws a red line from (29, 177) to (490, 109).
; PLAN: r0=29(x1), r1=177(y1), r2=490(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 177
LDI r2, 490
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
