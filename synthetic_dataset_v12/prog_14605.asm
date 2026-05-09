; DESCRIPTION: Composite: Draws a black circle centered at (278, 164) with radius 19 then Renders a white box of size 115x100 starting at (353, 103) then Places a cyan line segment connecting (427, 131) to (304, 124).
; PLAN: r0=278(x), r1=164(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x), r6=103(y), r7=115(width), r8=100(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=427(x1), r11=131(y1), r12=304(x2), r13=124(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 278
LDI r1, 164
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 103
LDI r7, 115
LDI r8, 100
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 427
LDI r11, 131
LDI r12, 304
LDI r13, 124
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
