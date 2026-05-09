; DESCRIPTION: Renders a purple line between points (189, 107) and (218, 116).
; PLAN: r0=189(x1), r1=107(y1), r2=218(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 107
LDI r2, 218
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
