; DESCRIPTION: Renders a red line between points (467, 108) and (264, 88).
; PLAN: r0=467(x1), r1=108(y1), r2=264(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 108
LDI r2, 264
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
