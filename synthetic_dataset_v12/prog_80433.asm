; DESCRIPTION: Places a blue line segment connecting (58, 82) to (65, 71).
; PLAN: r0=58(x1), r1=82(y1), r2=65(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 82
LDI r2, 65
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
