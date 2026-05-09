; DESCRIPTION: Renders a purple line between points (379, 221) and (252, 111).
; PLAN: r0=379(x1), r1=221(y1), r2=252(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 221
LDI r2, 252
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
