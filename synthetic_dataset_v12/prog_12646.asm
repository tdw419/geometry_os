; DESCRIPTION: Draws a yellow line from (317, 139) to (463, 212).
; PLAN: r0=317(x1), r1=139(y1), r2=463(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 139
LDI r2, 463
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
