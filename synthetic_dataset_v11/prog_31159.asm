; DESCRIPTION: Places a black line segment connecting (43, 179) to (32, 111).
; PLAN: r0=43(x1), r1=179(y1), r2=32(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 179
LDI r2, 32
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
