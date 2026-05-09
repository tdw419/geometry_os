; DESCRIPTION: Renders a magenta line between points (176, 0) and (8, 151).
; PLAN: r0=176(x1), r1=0(y1), r2=8(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 0
LDI r2, 8
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
