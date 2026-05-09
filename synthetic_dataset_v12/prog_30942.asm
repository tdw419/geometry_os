; DESCRIPTION: Renders a blue line between points (409, 222) and (470, 88).
; PLAN: r0=409(x1), r1=222(y1), r2=470(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 222
LDI r2, 470
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
