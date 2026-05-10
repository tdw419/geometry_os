; DESCRIPTION: Draws a blue line from (90, 28) to (335, 53).
; PLAN: r0=90(x1), r1=28(y1), r2=335(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 28
LDI r2, 335
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
