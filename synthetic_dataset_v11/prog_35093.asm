; DESCRIPTION: Places a blue line segment connecting (215, 121) to (64, 222).
; PLAN: r0=215(x1), r1=121(y1), r2=64(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 121
LDI r2, 64
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
