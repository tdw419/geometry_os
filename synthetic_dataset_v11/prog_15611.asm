; DESCRIPTION: Renders a yellow line between points (186, 117) and (35, 111).
; PLAN: r0=186(x1), r1=117(y1), r2=35(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 117
LDI r2, 35
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
