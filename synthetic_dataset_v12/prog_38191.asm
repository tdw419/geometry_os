; DESCRIPTION: Draws a purple line from (387, 255) to (185, 196).
; PLAN: r0=387(x1), r1=255(y1), r2=185(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 255
LDI r2, 185
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
