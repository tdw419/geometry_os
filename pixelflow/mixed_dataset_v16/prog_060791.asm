; DESCRIPTION: Renders a black line between points (94, 20) and (50, 191).
; PLAN: r0=94(x1), r1=20(y1), r2=50(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 20
LDI r2, 50
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
