; DESCRIPTION: Composite: Places a green line segment connecting (44, 90) to (378, 95) then Draws a purple circle centered at (234, 208) with radius 16.
; PLAN: r0=44(x1), r1=90(y1), r2=378(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=234(x), r6=208(y), r7=16(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 44
LDI r1, 90
LDI r2, 378
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 208
LDI r7, 16
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
