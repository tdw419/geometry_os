; DESCRIPTION: Renders a blue line between points (60, 32) and (39, 136).
; PLAN: r0=60(x1), r1=32(y1), r2=39(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 32
LDI r2, 39
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
