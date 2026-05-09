; DESCRIPTION: Renders a black line between points (370, 48) and (139, 175).
; PLAN: r0=370(x1), r1=48(y1), r2=139(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 48
LDI r2, 139
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
