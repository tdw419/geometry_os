; DESCRIPTION: Composite: Creates a white circular shape at (367, 100) with radius 68 then Sets a single black pixel at (296, 5) then Draws a red rectangle at (403, 85) with width 91 and height 17.
; PLAN: r0=367(x), r1=100(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=296(x), r6=5(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=403(x), r11=85(y), r12=91(width), r13=17(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 100
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 296
LDI r6, 5
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 403
LDI r11, 85
LDI r12, 91
LDI r13, 17
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
