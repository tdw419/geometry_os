; DESCRIPTION: Renders a black line between points (4, 94) and (207, 83).
; PLAN: r0=4(x1), r1=94(y1), r2=207(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 94
LDI r2, 207
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
