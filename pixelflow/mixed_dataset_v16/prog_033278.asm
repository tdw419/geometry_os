; DESCRIPTION: Renders a red line between points (408, 187) and (477, 192).
; PLAN: r0=408(x1), r1=187(y1), r2=477(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 187
LDI r2, 477
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
