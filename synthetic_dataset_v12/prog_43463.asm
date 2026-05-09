; DESCRIPTION: Renders a purple line between points (69, 172) and (156, 151).
; PLAN: r0=69(x1), r1=172(y1), r2=156(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 172
LDI r2, 156
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
