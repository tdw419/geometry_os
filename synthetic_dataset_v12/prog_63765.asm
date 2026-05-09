; DESCRIPTION: Renders a blue line between points (415, 62) and (120, 6).
; PLAN: r0=415(x1), r1=62(y1), r2=120(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 62
LDI r2, 120
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
