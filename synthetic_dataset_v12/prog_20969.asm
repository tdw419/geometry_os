; DESCRIPTION: Renders a white line between points (179, 96) and (375, 104).
; PLAN: r0=179(x1), r1=96(y1), r2=375(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 96
LDI r2, 375
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
