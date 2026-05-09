; DESCRIPTION: Renders a white line between points (60, 157) and (14, 179).
; PLAN: r0=60(x1), r1=157(y1), r2=14(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 157
LDI r2, 14
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
