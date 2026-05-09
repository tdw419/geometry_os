; DESCRIPTION: Renders a purple line between points (195, 245) and (59, 151).
; PLAN: r0=195(x1), r1=245(y1), r2=59(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 245
LDI r2, 59
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
