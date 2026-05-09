; DESCRIPTION: Places a red line segment connecting (436, 238) to (302, 81).
; PLAN: r0=436(x1), r1=238(y1), r2=302(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 238
LDI r2, 302
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
