; DESCRIPTION: Composite: Draws a red circle centered at (75, 122) with radius 33 then Places a yellow line segment connecting (136, 224) to (189, 40).
; PLAN: r0=75(x), r1=122(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=136(x1), r6=224(y1), r7=189(x2), r8=40(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 75
LDI r1, 122
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 136
LDI r6, 224
LDI r7, 189
LDI r8, 40
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
