; DESCRIPTION: Composite: Creates a yellow circular shape at (313, 174) with radius 50 then Places a green 108x24 rectangle at position (278, 52) then Places a yellow line segment connecting (425, 4) to (468, 176).
; PLAN: r0=313(x), r1=174(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x), r6=52(y), r7=108(width), r8=24(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=425(x1), r11=4(y1), r12=468(x2), r13=176(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 174
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 52
LDI r7, 108
LDI r8, 24
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 4
LDI r12, 468
LDI r13, 176
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
