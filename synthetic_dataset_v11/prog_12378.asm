; DESCRIPTION: Renders a black line between points (252, 8) and (30, 94).
; PLAN: r0=252(x1), r1=8(y1), r2=30(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 8
LDI r2, 30
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
