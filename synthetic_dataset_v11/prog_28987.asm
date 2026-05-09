; DESCRIPTION: Renders a yellow line between points (59, 118) and (64, 74).
; PLAN: r0=59(x1), r1=118(y1), r2=64(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 118
LDI r2, 64
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
