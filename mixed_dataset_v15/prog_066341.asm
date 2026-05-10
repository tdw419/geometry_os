; DESCRIPTION: Renders a green line between points (353, 43) and (467, 48).
; PLAN: r0=353(x1), r1=43(y1), r2=467(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 43
LDI r2, 467
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
