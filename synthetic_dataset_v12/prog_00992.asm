; DESCRIPTION: Renders a blue line between points (494, 150) and (305, 96).
; PLAN: r0=494(x1), r1=150(y1), r2=305(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 150
LDI r2, 305
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
