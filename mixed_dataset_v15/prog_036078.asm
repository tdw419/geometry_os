; DESCRIPTION: Renders a red line between points (468, 10) and (467, 220).
; PLAN: r0=468(x1), r1=10(y1), r2=467(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 10
LDI r2, 467
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
