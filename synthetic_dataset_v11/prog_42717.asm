; DESCRIPTION: Places a black line segment connecting (124, 125) to (242, 111).
; PLAN: r0=124(x1), r1=125(y1), r2=242(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 125
LDI r2, 242
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
