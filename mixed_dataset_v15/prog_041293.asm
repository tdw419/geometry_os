; DESCRIPTION: Renders a blue line segment connecting (138, 142) to (144, 146).
; PLAN: r0=138(x1), r1=142(y1), r2=144(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 142
LDI r2, 144
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
