; DESCRIPTION: Renders a black line between points (22, 48) and (160, 135).
; PLAN: r0=22(x1), r1=48(y1), r2=160(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 48
LDI r2, 160
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
