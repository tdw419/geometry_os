; DESCRIPTION: Composite: Renders a red box of size 21x46 starting at (467, 120) then Places a white line segment connecting (381, 188) to (412, 191) then Draws a red circle centered at (230, 217) with radius 12.
; PLAN: r0=467(x), r1=120(y), r2=21(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x1), r6=188(y1), r7=412(x2), r8=191(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=230(x), r11=217(y), r12=12(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 467
LDI r1, 120
LDI r2, 21
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 188
LDI r7, 412
LDI r8, 191
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 230
LDI r11, 217
LDI r12, 12
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
