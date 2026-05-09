; DESCRIPTION: Renders a green line between points (116, 217) and (190, 186).
; PLAN: r0=116(x1), r1=217(y1), r2=190(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 217
LDI r2, 190
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
