; DESCRIPTION: Composite: Draws a black circle centered at (353, 152) with radius 26 then Renders a purple line between points (109, 53) and (153, 173).
; PLAN: r0=353(x), r1=152(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x1), r6=53(y1), r7=153(x2), r8=173(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 353
LDI r1, 152
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 53
LDI r7, 153
LDI r8, 173
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
