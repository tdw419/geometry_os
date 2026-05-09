; DESCRIPTION: Renders a blue line between points (127, 166) and (84, 141).
; PLAN: r0=127(x1), r1=166(y1), r2=84(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 166
LDI r2, 84
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
