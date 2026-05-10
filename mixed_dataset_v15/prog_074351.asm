; DESCRIPTION: Composite: Draws a orange rectangle at (100, 161) with width 116 and height 76 then Sets a single green pixel at (60, 233) then Places a blue circle of radius 67 at center (361, 155).
; PLAN: r0=100(x), r1=161(y), r2=116(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x), r6=233(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=361(x), r11=155(y), r12=67(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 100
LDI r1, 161
LDI r2, 116
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 233
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 361
LDI r11, 155
LDI r12, 67
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
