; DESCRIPTION: Draws a red line from (29, 182) to (106, 250).
; PLAN: r0=29(x1), r1=182(y1), r2=106(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 182
LDI r2, 106
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
