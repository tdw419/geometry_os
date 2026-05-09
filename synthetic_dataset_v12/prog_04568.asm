; DESCRIPTION: Renders a blue line between points (92, 25) and (262, 24).
; PLAN: r0=92(x1), r1=25(y1), r2=262(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 25
LDI r2, 262
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
