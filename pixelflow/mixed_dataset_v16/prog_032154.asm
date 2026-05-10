; DESCRIPTION: Draws a white line from (463, 40) to (377, 170).
; PLAN: r0=463(x1), r1=40(y1), r2=377(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 40
LDI r2, 377
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
