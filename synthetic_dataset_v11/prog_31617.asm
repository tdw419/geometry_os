; DESCRIPTION: Draws a white line from (216, 165) to (4, 179).
; PLAN: r0=216(x1), r1=165(y1), r2=4(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 165
LDI r2, 4
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
