; DESCRIPTION: Renders a cyan line between points (158, 115) and (495, 90).
; PLAN: r0=158(x1), r1=115(y1), r2=495(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 115
LDI r2, 495
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
