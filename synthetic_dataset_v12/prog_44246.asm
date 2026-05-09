; DESCRIPTION: Composite: Places a purple line segment connecting (489, 224) to (362, 141) then Draws a black circle centered at (157, 111) with radius 60.
; PLAN: r0=489(x1), r1=224(y1), r2=362(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=111(y), r7=60(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 489
LDI r1, 224
LDI r2, 362
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 111
LDI r7, 60
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
