; DESCRIPTION: Renders a purple line between points (55, 143) and (152, 26).
; PLAN: r0=55(x1), r1=143(y1), r2=152(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 143
LDI r2, 152
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
