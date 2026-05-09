; DESCRIPTION: Renders a yellow line between points (363, 184) and (339, 111).
; PLAN: r0=363(x1), r1=184(y1), r2=339(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 184
LDI r2, 339
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
