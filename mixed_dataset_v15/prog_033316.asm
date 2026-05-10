; DESCRIPTION: Composite: Draws a white circle centered at (366, 148) with radius 67 then Places a red line segment connecting (239, 22) to (379, 178).
; PLAN: r0=366(x), r1=148(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=239(x1), r6=22(y1), r7=379(x2), r8=178(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 148
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 239
LDI r6, 22
LDI r7, 379
LDI r8, 178
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
