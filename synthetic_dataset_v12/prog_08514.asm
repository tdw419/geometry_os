; DESCRIPTION: Renders a red line between points (378, 146) and (96, 40).
; PLAN: r0=378(x1), r1=146(y1), r2=96(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 146
LDI r2, 96
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
