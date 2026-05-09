; DESCRIPTION: Renders a purple line between points (486, 31) and (446, 115).
; PLAN: r0=486(x1), r1=31(y1), r2=446(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 31
LDI r2, 446
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
