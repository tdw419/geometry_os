; DESCRIPTION: Renders a red line between points (388, 50) and (252, 143).
; PLAN: r0=388(x1), r1=50(y1), r2=252(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 50
LDI r2, 252
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
