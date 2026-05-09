; DESCRIPTION: Composite: Draws a green circle centered at (252, 146) with radius 62 then Draws a white line from (364, 27) to (62, 95) then Places a black 53x93 rectangle at position (321, 95).
; PLAN: r0=252(x), r1=146(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=364(x1), r6=27(y1), r7=62(x2), r8=95(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=321(x), r11=95(y), r12=53(width), r13=93(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 146
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 364
LDI r6, 27
LDI r7, 62
LDI r8, 95
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 321
LDI r11, 95
LDI r12, 53
LDI r13, 93
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
