; DESCRIPTION: Draws a red line from (163, 12) to (208, 69).
; PLAN: r0=163(x1), r1=12(y1), r2=208(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 12
LDI r2, 208
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
