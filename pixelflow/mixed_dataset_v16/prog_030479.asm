; DESCRIPTION: Places a blue line segment connecting (136, 73) to (511, 55).
; PLAN: r0=136(x1), r1=73(y1), r2=511(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 73
LDI r2, 511
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
