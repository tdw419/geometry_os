; DESCRIPTION: Draws a red line from (148, 158) to (225, 196).
; PLAN: r0=148(x1), r1=158(y1), r2=225(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 158
LDI r2, 225
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
