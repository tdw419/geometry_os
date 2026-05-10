; DESCRIPTION: Draws a purple line from (258, 16) to (317, 133).
; PLAN: r0=258(x1), r1=16(y1), r2=317(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 16
LDI r2, 317
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
