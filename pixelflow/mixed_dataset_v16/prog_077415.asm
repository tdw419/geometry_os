; DESCRIPTION: Places a blue line segment connecting (443, 67) to (240, 238).
; PLAN: r0=443(x1), r1=67(y1), r2=240(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 67
LDI r2, 240
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
