; DESCRIPTION: Renders a blue line between points (120, 54) and (127, 109).
; PLAN: r0=120(x1), r1=54(y1), r2=127(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 54
LDI r2, 127
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
