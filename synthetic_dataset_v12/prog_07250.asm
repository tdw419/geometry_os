; DESCRIPTION: Places a purple line segment connecting (271, 69) to (257, 111).
; PLAN: r0=271(x1), r1=69(y1), r2=257(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 69
LDI r2, 257
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
