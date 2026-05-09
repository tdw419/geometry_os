; DESCRIPTION: Renders a blue line between points (161, 18) and (135, 64).
; PLAN: r0=161(x1), r1=18(y1), r2=135(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 18
LDI r2, 135
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
