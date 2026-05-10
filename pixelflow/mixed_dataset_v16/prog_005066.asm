; DESCRIPTION: Draws a white line from (495, 80) to (188, 183).
; PLAN: r0=495(x1), r1=80(y1), r2=188(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 80
LDI r2, 188
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
