; DESCRIPTION: Renders a blue line between points (95, 197) and (246, 97).
; PLAN: r0=95(x1), r1=197(y1), r2=246(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 197
LDI r2, 246
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
