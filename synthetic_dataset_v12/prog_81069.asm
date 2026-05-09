; DESCRIPTION: Composite: Draws a white circle centered at (302, 226) with radius 16 then Draws a orange rectangle at (273, 40) with width 53 and height 84 then Places a red dot at position (400, 230).
; PLAN: r0=302(x), r1=226(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x), r6=40(y), r7=53(width), r8=84(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=400(x), r11=230(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 302
LDI r1, 226
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 40
LDI r7, 53
LDI r8, 84
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 230
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
