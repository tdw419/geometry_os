; DESCRIPTION: Renders a red line between points (273, 115) and (151, 111).
; PLAN: r0=273(x1), r1=115(y1), r2=151(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 115
LDI r2, 151
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
