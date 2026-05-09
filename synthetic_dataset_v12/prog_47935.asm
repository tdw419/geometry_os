; DESCRIPTION: Draws a blue line from (495, 93) to (491, 88).
; PLAN: r0=495(x1), r1=93(y1), r2=491(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 93
LDI r2, 491
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
