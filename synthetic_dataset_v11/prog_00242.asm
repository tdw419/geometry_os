; DESCRIPTION: Renders a red line between points (127, 169) and (220, 111).
; PLAN: r0=127(x1), r1=169(y1), r2=220(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 169
LDI r2, 220
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
