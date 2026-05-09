; DESCRIPTION: Renders a black line between points (446, 75) and (261, 106).
; PLAN: r0=446(x1), r1=75(y1), r2=261(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 75
LDI r2, 261
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
