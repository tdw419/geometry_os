; DESCRIPTION: Renders a blue line between points (96, 166) and (155, 42).
; PLAN: r0=96(x1), r1=166(y1), r2=155(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 166
LDI r2, 155
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
