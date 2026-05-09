; DESCRIPTION: Renders a magenta line between points (165, 190) and (196, 151).
; PLAN: r0=165(x1), r1=190(y1), r2=196(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 190
LDI r2, 196
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
