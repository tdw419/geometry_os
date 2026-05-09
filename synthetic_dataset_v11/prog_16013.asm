; DESCRIPTION: Renders a black line between points (88, 216) and (230, 111).
; PLAN: r0=88(x1), r1=216(y1), r2=230(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 216
LDI r2, 230
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
