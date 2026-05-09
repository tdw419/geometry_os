; DESCRIPTION: Places a blue line segment connecting (242, 158) to (485, 12).
; PLAN: r0=242(x1), r1=158(y1), r2=485(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 158
LDI r2, 485
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
