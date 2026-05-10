; DESCRIPTION: Composite: Renders a orange box of size 69x97 starting at (293, 115) then Places a blue dot at position (91, 41) then Creates a yellow circular shape at (460, 25) with radius 18.
; PLAN: r0=293(x), r1=115(y), r2=69(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=91(x), r6=41(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=460(x), r11=25(y), r12=18(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 293
LDI r1, 115
LDI r2, 69
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 41
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 460
LDI r11, 25
LDI r12, 18
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
