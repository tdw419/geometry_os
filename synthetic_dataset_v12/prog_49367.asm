; DESCRIPTION: Renders a blue line between points (465, 168) and (421, 116).
; PLAN: r0=465(x1), r1=168(y1), r2=421(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 168
LDI r2, 421
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
