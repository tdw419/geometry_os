; DESCRIPTION: Renders a red line between points (144, 176) and (139, 103).
; PLAN: r0=144(x1), r1=176(y1), r2=139(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 176
LDI r2, 139
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
