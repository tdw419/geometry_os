; DESCRIPTION: Renders a blue line between points (460, 95) and (491, 64).
; PLAN: r0=460(x1), r1=95(y1), r2=491(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 95
LDI r2, 491
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
