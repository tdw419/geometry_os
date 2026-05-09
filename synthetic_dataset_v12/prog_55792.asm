; DESCRIPTION: Renders a black line between points (94, 14) and (263, 90).
; PLAN: r0=94(x1), r1=14(y1), r2=263(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 14
LDI r2, 263
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
