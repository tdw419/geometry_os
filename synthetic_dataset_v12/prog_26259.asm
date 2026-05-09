; DESCRIPTION: Places a blue line segment connecting (33, 111) to (82, 232).
; PLAN: r0=33(x1), r1=111(y1), r2=82(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 111
LDI r2, 82
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
