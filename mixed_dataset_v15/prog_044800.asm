; DESCRIPTION: Renders a purple line between points (467, 108) and (281, 248).
; PLAN: r0=467(x1), r1=108(y1), r2=281(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 108
LDI r2, 281
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
