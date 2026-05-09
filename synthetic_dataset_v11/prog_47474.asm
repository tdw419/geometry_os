; DESCRIPTION: Renders a black line between points (14, 200) and (48, 34).
; PLAN: r0=14(x1), r1=200(y1), r2=48(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 200
LDI r2, 48
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
