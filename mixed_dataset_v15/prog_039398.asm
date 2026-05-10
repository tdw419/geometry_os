; DESCRIPTION: Renders a red line between points (276, 161) and (361, 81).
; PLAN: r0=276(x1), r1=161(y1), r2=361(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 161
LDI r2, 361
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
