; DESCRIPTION: Renders a cyan line segment connecting (110, 118) to (185, 82).
; PLAN: r0=110(x1), r1=118(y1), r2=185(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 118
LDI r2, 185
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
