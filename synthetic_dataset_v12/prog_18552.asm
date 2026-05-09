; DESCRIPTION: Renders a purple line between points (349, 246) and (99, 198).
; PLAN: r0=349(x1), r1=246(y1), r2=99(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 246
LDI r2, 99
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
