; DESCRIPTION: Renders a purple line between points (246, 152) and (205, 149).
; PLAN: r0=246(x1), r1=152(y1), r2=205(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 152
LDI r2, 205
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
