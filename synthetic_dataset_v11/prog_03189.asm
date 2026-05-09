; DESCRIPTION: Renders a blue line between points (111, 132) and (120, 189).
; PLAN: r0=111(x1), r1=132(y1), r2=120(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 132
LDI r2, 120
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
