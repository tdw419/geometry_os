; DESCRIPTION: Draws a blue line from (484, 128) to (124, 249).
; PLAN: r0=484(x1), r1=128(y1), r2=124(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 128
LDI r2, 124
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
