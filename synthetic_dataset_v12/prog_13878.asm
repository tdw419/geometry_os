; DESCRIPTION: Renders a black line between points (135, 94) and (111, 88).
; PLAN: r0=135(x1), r1=94(y1), r2=111(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 94
LDI r2, 111
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
