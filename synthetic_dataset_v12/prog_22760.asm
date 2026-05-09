; DESCRIPTION: Composite: Sets a single green pixel at (482, 231) then Places a red line segment connecting (459, 165) to (274, 153) then Draws a red rectangle at (75, 95) with width 78 and height 119.
; PLAN: r0=482(x), r1=231(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=459(x1), r6=165(y1), r7=274(x2), r8=153(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=75(x), r11=95(y), r12=78(width), r13=119(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 482
LDI r1, 231
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 459
LDI r6, 165
LDI r7, 274
LDI r8, 153
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 95
LDI r12, 78
LDI r13, 119
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
