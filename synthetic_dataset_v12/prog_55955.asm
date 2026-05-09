; DESCRIPTION: Draws a red line from (442, 48) to (93, 104).
; PLAN: r0=442(x1), r1=48(y1), r2=93(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 48
LDI r2, 93
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
