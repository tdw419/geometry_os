; DESCRIPTION: Renders a red line between points (9, 20) and (143, 151).
; PLAN: r0=9(x1), r1=20(y1), r2=143(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 20
LDI r2, 143
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
