; DESCRIPTION: Draws a blue line from (64, 66) to (35, 47).
; PLAN: r0=64(x1), r1=66(y1), r2=35(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 66
LDI r2, 35
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
