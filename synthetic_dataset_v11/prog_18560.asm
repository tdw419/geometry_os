; DESCRIPTION: Renders a blue line between points (103, 184) and (15, 253).
; PLAN: r0=103(x1), r1=184(y1), r2=15(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 184
LDI r2, 15
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
