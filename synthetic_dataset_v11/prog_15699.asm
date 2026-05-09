; DESCRIPTION: Draws a blue line from (1, 14) to (239, 158).
; PLAN: r0=1(x1), r1=14(y1), r2=239(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 14
LDI r2, 239
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
