; DESCRIPTION: Draws a blue line from (315, 98) to (379, 33).
; PLAN: r0=315(x1), r1=98(y1), r2=379(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 98
LDI r2, 379
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
