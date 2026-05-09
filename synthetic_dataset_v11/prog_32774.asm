; DESCRIPTION: Renders a blue line between points (105, 93) and (154, 163).
; PLAN: r0=105(x1), r1=93(y1), r2=154(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 93
LDI r2, 154
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
