; DESCRIPTION: Composite: Places a purple line segment connecting (280, 140) to (276, 213) then Renders a magenta disk with center (483, 26) and radius 17.
; PLAN: r0=280(x1), r1=140(y1), r2=276(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=483(x), r6=26(y), r7=17(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 280
LDI r1, 140
LDI r2, 276
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 26
LDI r7, 17
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
