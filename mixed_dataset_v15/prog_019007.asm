; DESCRIPTION: Renders a red line between points (361, 248) and (467, 24).
; PLAN: r0=361(x1), r1=248(y1), r2=467(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 248
LDI r2, 467
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
