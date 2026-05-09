; DESCRIPTION: Renders a black line between points (20, 120) and (249, 34).
; PLAN: r0=20(x1), r1=120(y1), r2=249(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 120
LDI r2, 249
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
