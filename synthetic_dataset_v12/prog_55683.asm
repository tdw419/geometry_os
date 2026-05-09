; DESCRIPTION: Places a black line segment connecting (222, 18) to (410, 111).
; PLAN: r0=222(x1), r1=18(y1), r2=410(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 18
LDI r2, 410
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
