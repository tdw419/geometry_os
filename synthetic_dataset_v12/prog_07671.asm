; DESCRIPTION: Renders a magenta line between points (25, 153) and (278, 93).
; PLAN: r0=25(x1), r1=153(y1), r2=278(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 153
LDI r2, 278
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
