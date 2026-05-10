; DESCRIPTION: Renders a blue line between points (288, 135) and (353, 43).
; PLAN: r0=288(x1), r1=135(y1), r2=353(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 135
LDI r2, 353
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
