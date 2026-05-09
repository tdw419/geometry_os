; DESCRIPTION: Places a blue line segment connecting (39, 247) to (21, 82).
; PLAN: r0=39(x1), r1=247(y1), r2=21(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 247
LDI r2, 21
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
