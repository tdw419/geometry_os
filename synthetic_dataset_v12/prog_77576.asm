; DESCRIPTION: Renders a red line between points (458, 60) and (305, 248).
; PLAN: r0=458(x1), r1=60(y1), r2=305(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 60
LDI r2, 305
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
