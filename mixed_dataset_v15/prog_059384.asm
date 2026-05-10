; DESCRIPTION: Renders a blue line between points (121, 242) and (494, 80).
; PLAN: r0=121(x1), r1=242(y1), r2=494(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 242
LDI r2, 494
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
