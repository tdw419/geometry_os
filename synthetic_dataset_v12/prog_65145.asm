; DESCRIPTION: Renders a red line between points (236, 182) and (426, 169).
; PLAN: r0=236(x1), r1=182(y1), r2=426(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 182
LDI r2, 426
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
