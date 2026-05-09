; DESCRIPTION: Renders a magenta line between points (144, 36) and (39, 116).
; PLAN: r0=144(x1), r1=36(y1), r2=39(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 36
LDI r2, 39
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
