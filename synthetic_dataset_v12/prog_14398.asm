; DESCRIPTION: Renders a blue line between points (377, 52) and (42, 101).
; PLAN: r0=377(x1), r1=52(y1), r2=42(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 52
LDI r2, 42
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
