; DESCRIPTION: Places a red line segment connecting (313, 238) to (464, 102).
; PLAN: r0=313(x1), r1=238(y1), r2=464(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 238
LDI r2, 464
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
