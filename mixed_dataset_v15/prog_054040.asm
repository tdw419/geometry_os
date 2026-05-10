; DESCRIPTION: Draws a blue line from (456, 48) to (381, 81).
; PLAN: r0=456(x1), r1=48(y1), r2=381(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 48
LDI r2, 381
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
