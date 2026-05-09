; DESCRIPTION: Renders a black line between points (87, 172) and (248, 118).
; PLAN: r0=87(x1), r1=172(y1), r2=248(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 172
LDI r2, 248
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
