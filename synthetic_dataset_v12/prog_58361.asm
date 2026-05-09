; DESCRIPTION: Renders a blue line between points (356, 160) and (480, 72).
; PLAN: r0=356(x1), r1=160(y1), r2=480(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 160
LDI r2, 480
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
