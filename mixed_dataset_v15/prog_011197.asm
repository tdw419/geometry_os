; DESCRIPTION: Renders a purple line between points (202, 133) and (492, 68).
; PLAN: r0=202(x1), r1=133(y1), r2=492(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 133
LDI r2, 492
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
