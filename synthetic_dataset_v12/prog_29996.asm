; DESCRIPTION: Draws a blue line from (354, 134) to (379, 72).
; PLAN: r0=354(x1), r1=134(y1), r2=379(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 134
LDI r2, 379
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
