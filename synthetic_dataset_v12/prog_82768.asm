; DESCRIPTION: Draws a white line from (199, 158) to (96, 167).
; PLAN: r0=199(x1), r1=158(y1), r2=96(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 158
LDI r2, 96
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
