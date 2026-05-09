; DESCRIPTION: Draws a blue line from (152, 14) to (64, 230).
; PLAN: r0=152(x1), r1=14(y1), r2=64(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 14
LDI r2, 64
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
