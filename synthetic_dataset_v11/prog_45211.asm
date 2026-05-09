; DESCRIPTION: Renders a magenta line between points (59, 133) and (148, 250).
; PLAN: r0=59(x1), r1=133(y1), r2=148(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 133
LDI r2, 148
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
