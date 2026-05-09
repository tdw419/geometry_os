; DESCRIPTION: Composite: Draws a magenta circle centered at (440, 121) with radius 59 then Renders a orange box of size 84x108 starting at (14, 104) then Places a magenta dot at position (138, 149).
; PLAN: r0=440(x), r1=121(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x), r6=104(y), r7=84(width), r8=108(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=138(x), r11=149(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 440
LDI r1, 121
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 104
LDI r7, 84
LDI r8, 108
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 138
LDI r11, 149
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
