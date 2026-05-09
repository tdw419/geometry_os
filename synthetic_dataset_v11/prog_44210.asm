; DESCRIPTION: Places a black line segment connecting (82, 110) to (138, 111).
; PLAN: r0=82(x1), r1=110(y1), r2=138(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 110
LDI r2, 138
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
