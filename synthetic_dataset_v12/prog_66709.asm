; DESCRIPTION: Renders a magenta line between points (301, 23) and (460, 116).
; PLAN: r0=301(x1), r1=23(y1), r2=460(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 23
LDI r2, 460
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
