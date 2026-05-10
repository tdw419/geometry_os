; DESCRIPTION: Renders a red line segment connecting (359, 99) to (197, 111).
; PLAN: r0=359(x1), r1=99(y1), r2=197(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 99
LDI r2, 197
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
