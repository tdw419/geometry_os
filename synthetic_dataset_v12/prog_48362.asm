; DESCRIPTION: Draws a red line from (507, 140) to (177, 1).
; PLAN: r0=507(x1), r1=140(y1), r2=177(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 140
LDI r2, 177
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
