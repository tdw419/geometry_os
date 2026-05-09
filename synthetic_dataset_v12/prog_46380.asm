; DESCRIPTION: Draws a white line from (49, 80) to (171, 179).
; PLAN: r0=49(x1), r1=80(y1), r2=171(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 80
LDI r2, 171
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
