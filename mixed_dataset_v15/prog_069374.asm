; DESCRIPTION: Places a blue line segment connecting (456, 198) to (485, 192).
; PLAN: r0=456(x1), r1=198(y1), r2=485(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 198
LDI r2, 485
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
