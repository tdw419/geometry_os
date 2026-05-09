; DESCRIPTION: Renders a red line between points (388, 192) and (213, 114).
; PLAN: r0=388(x1), r1=192(y1), r2=213(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 192
LDI r2, 213
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
