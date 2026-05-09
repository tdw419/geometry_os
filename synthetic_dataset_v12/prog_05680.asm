; DESCRIPTION: Renders a red line between points (466, 3) and (176, 207).
; PLAN: r0=466(x1), r1=3(y1), r2=176(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 3
LDI r2, 176
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
