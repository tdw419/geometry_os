; DESCRIPTION: Renders a blue line between points (92, 225) and (243, 71).
; PLAN: r0=92(x1), r1=225(y1), r2=243(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 225
LDI r2, 243
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
