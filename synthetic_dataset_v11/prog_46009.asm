; DESCRIPTION: Draws a red line from (33, 227) to (222, 167).
; PLAN: r0=33(x1), r1=227(y1), r2=222(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 227
LDI r2, 222
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
