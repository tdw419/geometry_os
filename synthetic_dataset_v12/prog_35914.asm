; DESCRIPTION: Renders a green line between points (143, 90) and (442, 151).
; PLAN: r0=143(x1), r1=90(y1), r2=442(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 90
LDI r2, 442
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
