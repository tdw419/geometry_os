; DESCRIPTION: Renders a blue line between points (353, 30) and (116, 251).
; PLAN: r0=353(x1), r1=30(y1), r2=116(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 30
LDI r2, 116
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
