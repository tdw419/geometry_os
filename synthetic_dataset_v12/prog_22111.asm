; DESCRIPTION: Draws a blue line from (460, 24) to (503, 49).
; PLAN: r0=460(x1), r1=24(y1), r2=503(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 24
LDI r2, 503
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
