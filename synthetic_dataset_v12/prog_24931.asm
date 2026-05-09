; DESCRIPTION: Renders a blue line between points (485, 192) and (196, 230).
; PLAN: r0=485(x1), r1=192(y1), r2=196(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 192
LDI r2, 196
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
