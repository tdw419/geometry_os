; DESCRIPTION: Places a blue line segment connecting (221, 71) to (238, 178).
; PLAN: r0=221(x1), r1=71(y1), r2=238(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 71
LDI r2, 238
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
