; DESCRIPTION: Composite: Places a white line segment connecting (370, 43) to (300, 130) then Creates a black rectangular region at (172, 137) spanning 88 by 61 pixels.
; PLAN: r0=370(x1), r1=43(y1), r2=300(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=172(x), r6=137(y), r7=88(width), r8=61(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 43
LDI r2, 300
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 137
LDI r7, 88
LDI r8, 61
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
