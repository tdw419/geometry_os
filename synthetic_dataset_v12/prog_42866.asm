; DESCRIPTION: Renders a black line between points (242, 88) and (9, 4).
; PLAN: r0=242(x1), r1=88(y1), r2=9(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 88
LDI r2, 9
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
