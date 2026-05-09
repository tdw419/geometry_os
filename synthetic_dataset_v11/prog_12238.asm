; DESCRIPTION: Renders a magenta line between points (151, 238) and (96, 1).
; PLAN: r0=151(x1), r1=238(y1), r2=96(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 238
LDI r2, 96
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
