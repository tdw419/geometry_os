; DESCRIPTION: Renders a red line between points (352, 82) and (73, 235).
; PLAN: r0=352(x1), r1=82(y1), r2=73(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 82
LDI r2, 73
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
