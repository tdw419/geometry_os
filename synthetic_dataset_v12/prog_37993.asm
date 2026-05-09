; DESCRIPTION: Renders a magenta line between points (188, 87) and (424, 111).
; PLAN: r0=188(x1), r1=87(y1), r2=424(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 87
LDI r2, 424
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
