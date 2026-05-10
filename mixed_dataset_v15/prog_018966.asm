; DESCRIPTION: Places a blue line segment connecting (362, 73) to (492, 244).
; PLAN: r0=362(x1), r1=73(y1), r2=492(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 73
LDI r2, 492
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
