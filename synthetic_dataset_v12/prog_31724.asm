; DESCRIPTION: Renders a black line between points (116, 14) and (360, 140).
; PLAN: r0=116(x1), r1=14(y1), r2=360(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 14
LDI r2, 360
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
