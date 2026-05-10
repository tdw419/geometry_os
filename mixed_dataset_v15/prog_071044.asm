; DESCRIPTION: Composite: Creates a green circular shape at (291, 147) with radius 61 then Renders a white box of size 20x75 starting at (261, 7) then Places a purple line segment connecting (171, 61) to (98, 196).
; PLAN: r0=291(x), r1=147(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x), r6=7(y), r7=20(width), r8=75(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=171(x1), r11=61(y1), r12=98(x2), r13=196(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 147
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 7
LDI r7, 20
LDI r8, 75
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 61
LDI r12, 98
LDI r13, 196
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
