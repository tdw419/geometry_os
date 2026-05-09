; DESCRIPTION: Renders a blue line between points (172, 59) and (417, 111).
; PLAN: r0=172(x1), r1=59(y1), r2=417(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 59
LDI r2, 417
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
