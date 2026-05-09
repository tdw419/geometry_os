; DESCRIPTION: Places a blue line segment connecting (215, 122) to (60, 59).
; PLAN: r0=215(x1), r1=122(y1), r2=60(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 122
LDI r2, 60
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
