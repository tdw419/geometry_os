; DESCRIPTION: Renders a magenta line between points (361, 130) and (114, 151).
; PLAN: r0=361(x1), r1=130(y1), r2=114(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 130
LDI r2, 114
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
