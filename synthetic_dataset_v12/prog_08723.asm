; DESCRIPTION: Renders a blue line between points (220, 21) and (356, 153).
; PLAN: r0=220(x1), r1=21(y1), r2=356(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 21
LDI r2, 356
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
