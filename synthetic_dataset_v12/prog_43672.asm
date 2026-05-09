; DESCRIPTION: Composite: Draws a yellow line from (181, 126) to (181, 110) then Draws a black rectangle at (116, 164) with width 60 and height 28 then Places a white circle of radius 21 at center (269, 115).
; PLAN: r0=181(x1), r1=126(y1), r2=181(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=164(y), r7=60(width), r8=28(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=269(x), r11=115(y), r12=21(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 181
LDI r1, 126
LDI r2, 181
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 164
LDI r7, 60
LDI r8, 28
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 115
LDI r12, 21
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
