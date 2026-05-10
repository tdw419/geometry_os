; DESCRIPTION: Composite: Draws a red circle centered at (352, 126) with radius 79 then Places a cyan line segment connecting (391, 43) to (297, 92) then Draws a green rectangle at (300, 30) with width 13 and height 55.
; PLAN: r0=352(x), r1=126(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x1), r6=43(y1), r7=297(x2), r8=92(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=300(x), r11=30(y), r12=13(width), r13=55(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 126
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 43
LDI r7, 297
LDI r8, 92
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 30
LDI r12, 13
LDI r13, 55
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
