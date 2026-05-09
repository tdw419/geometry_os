; DESCRIPTION: Draws a blue line from (182, 144) to (491, 73).
; PLAN: r0=182(x1), r1=144(y1), r2=491(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 144
LDI r2, 491
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
