; DESCRIPTION: Places a black line segment connecting (31, 111) to (163, 192).
; PLAN: r0=31(x1), r1=111(y1), r2=163(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 111
LDI r2, 163
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
