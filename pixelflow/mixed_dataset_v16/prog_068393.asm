; DESCRIPTION: Renders a purple line between points (213, 16) and (83, 241).
; PLAN: r0=213(x1), r1=16(y1), r2=83(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 16
LDI r2, 83
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
