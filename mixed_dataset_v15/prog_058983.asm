; DESCRIPTION: Composite: Draws a white rectangle at (289, 98) with width 28 and height 12 then Draws a green line from (344, 23) to (302, 252) then Places a black circle of radius 32 at center (187, 125).
; PLAN: r0=289(x), r1=98(y), r2=28(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x1), r6=23(y1), r7=302(x2), r8=252(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=187(x), r11=125(y), r12=32(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 289
LDI r1, 98
LDI r2, 28
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 23
LDI r7, 302
LDI r8, 252
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 125
LDI r12, 32
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
