; DESCRIPTION: Draws a blue line from (177, 171) to (158, 148).
; PLAN: r0=177(x1), r1=171(y1), r2=158(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 171
LDI r2, 158
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
