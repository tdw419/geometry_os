; DESCRIPTION: Renders a purple line between points (364, 221) and (276, 36).
; PLAN: r0=364(x1), r1=221(y1), r2=276(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 221
LDI r2, 276
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
