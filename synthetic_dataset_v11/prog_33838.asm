; DESCRIPTION: Renders a blue line between points (85, 172) and (29, 111).
; PLAN: r0=85(x1), r1=172(y1), r2=29(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 172
LDI r2, 29
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
