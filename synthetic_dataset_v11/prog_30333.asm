; DESCRIPTION: Draws a blue line from (198, 128) to (142, 175).
; PLAN: r0=198(x1), r1=128(y1), r2=142(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 128
LDI r2, 142
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
