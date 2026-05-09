; DESCRIPTION: Renders a blue line between points (127, 174) and (32, 69).
; PLAN: r0=127(x1), r1=174(y1), r2=32(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 174
LDI r2, 32
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
