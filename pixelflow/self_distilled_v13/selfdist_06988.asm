; DESCRIPTION: Draws a blue line from (71, 190) to (240, 116).
; PLAN: r0=71(x1), r1=190(y1), r2=240(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 190
LDI r2, 240
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
