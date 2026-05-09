; DESCRIPTION: Places a black line segment connecting (9, 216) to (108, 111).
; PLAN: r0=9(x1), r1=216(y1), r2=108(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 216
LDI r2, 108
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
