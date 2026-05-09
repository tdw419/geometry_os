; DESCRIPTION: Composite: Places a black 49x61 rectangle at position (370, 128) then Places a white line segment connecting (387, 251) to (76, 125) then Draws a orange circle centered at (124, 114) with radius 68.
; PLAN: r0=370(x), r1=128(y), r2=49(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x1), r6=251(y1), r7=76(x2), r8=125(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=124(x), r11=114(y), r12=68(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 370
LDI r1, 128
LDI r2, 49
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 251
LDI r7, 76
LDI r8, 125
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 114
LDI r12, 68
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
