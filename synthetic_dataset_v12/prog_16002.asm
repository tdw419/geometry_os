; DESCRIPTION: Renders a red line between points (286, 81) and (229, 50).
; PLAN: r0=286(x1), r1=81(y1), r2=229(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 81
LDI r2, 229
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
