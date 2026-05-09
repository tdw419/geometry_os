; DESCRIPTION: Renders a purple line between points (122, 42) and (413, 151).
; PLAN: r0=122(x1), r1=42(y1), r2=413(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 42
LDI r2, 413
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
