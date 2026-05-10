; DESCRIPTION: Draws a white line from (84, 122) to (385, 96).
; PLAN: r0=84(x1), r1=122(y1), r2=385(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 122
LDI r2, 385
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
