; DESCRIPTION: Draws a white line from (22, 70) to (297, 183).
; PLAN: r0=22(x1), r1=70(y1), r2=297(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 70
LDI r2, 297
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
