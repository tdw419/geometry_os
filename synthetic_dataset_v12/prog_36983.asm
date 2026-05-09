; DESCRIPTION: Renders a green line between points (466, 136) and (467, 151).
; PLAN: r0=466(x1), r1=136(y1), r2=467(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 136
LDI r2, 467
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
