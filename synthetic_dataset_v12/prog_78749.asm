; DESCRIPTION: Renders a blue line between points (356, 96) and (138, 73).
; PLAN: r0=356(x1), r1=96(y1), r2=138(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 96
LDI r2, 138
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
