; DESCRIPTION: Renders a yellow line between points (414, 208) and (116, 190).
; PLAN: r0=414(x1), r1=208(y1), r2=116(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 208
LDI r2, 116
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
