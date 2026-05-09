; DESCRIPTION: Renders a blue line between points (374, 105) and (395, 213).
; PLAN: r0=374(x1), r1=105(y1), r2=395(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 105
LDI r2, 395
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
