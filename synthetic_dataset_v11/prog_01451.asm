; DESCRIPTION: Renders a green line between points (120, 96) and (248, 179).
; PLAN: r0=120(x1), r1=96(y1), r2=248(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 96
LDI r2, 248
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
