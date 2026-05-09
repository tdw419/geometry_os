; DESCRIPTION: Composite: Draws a cyan circle centered at (244, 130) with radius 69 then Places a orange dot at position (114, 60) then Places a cyan 120x97 rectangle at position (46, 41).
; PLAN: r0=244(x), r1=130(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=114(x), r6=60(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=46(x), r11=41(y), r12=120(width), r13=97(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 130
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 114
LDI r6, 60
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 46
LDI r11, 41
LDI r12, 120
LDI r13, 97
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
