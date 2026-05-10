; DESCRIPTION: Renders a yellow line between points (467, 230) and (203, 237).
; PLAN: r0=467(x1), r1=230(y1), r2=203(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 230
LDI r2, 203
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
