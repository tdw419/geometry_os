; DESCRIPTION: Renders a red line between points (505, 96) and (323, 207).
; PLAN: r0=505(x1), r1=96(y1), r2=323(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 96
LDI r2, 323
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
