; DESCRIPTION: Draws a white line from (463, 178) to (60, 158).
; PLAN: r0=463(x1), r1=178(y1), r2=60(x2), r3=158(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 178
LDI r2, 60
LDI r3, 158
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
