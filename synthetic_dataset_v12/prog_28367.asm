; DESCRIPTION: Draws a red line from (140, 40) to (495, 139).
; PLAN: r0=140(x1), r1=40(y1), r2=495(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 40
LDI r2, 495
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
