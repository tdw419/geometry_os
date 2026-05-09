; DESCRIPTION: Places a blue line segment connecting (86, 130) to (485, 248).
; PLAN: r0=86(x1), r1=130(y1), r2=485(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 130
LDI r2, 485
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
