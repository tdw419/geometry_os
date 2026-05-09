; DESCRIPTION: Renders a blue line between points (74, 118) and (27, 111).
; PLAN: r0=74(x1), r1=118(y1), r2=27(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 118
LDI r2, 27
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
