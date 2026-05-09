; DESCRIPTION: Composite: Places a blue 107x63 rectangle at position (41, 70) then Places a white dot at position (252, 70) then Creates a green circular shape at (296, 77) with radius 53.
; PLAN: r0=41(x), r1=70(y), r2=107(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=252(x), r6=70(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=296(x), r11=77(y), r12=53(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 41
LDI r1, 70
LDI r2, 107
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 70
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 296
LDI r11, 77
LDI r12, 53
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
