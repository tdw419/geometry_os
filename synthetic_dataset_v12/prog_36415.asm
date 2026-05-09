; DESCRIPTION: Renders a black line between points (317, 130) and (31, 102).
; PLAN: r0=317(x1), r1=130(y1), r2=31(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 130
LDI r2, 31
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
