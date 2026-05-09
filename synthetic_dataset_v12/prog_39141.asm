; DESCRIPTION: Renders a blue line between points (197, 92) and (205, 6).
; PLAN: r0=197(x1), r1=92(y1), r2=205(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 92
LDI r2, 205
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
