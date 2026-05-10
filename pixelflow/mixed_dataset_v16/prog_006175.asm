; DESCRIPTION: Draws a blue line from (222, 7) to (356, 25).
; PLAN: r0=222(x1), r1=7(y1), r2=356(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 7
LDI r2, 356
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
