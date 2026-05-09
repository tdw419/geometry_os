; DESCRIPTION: Composite: Draws a orange rectangle at (318, 38) with width 103 and height 51 then Places a yellow dot at position (409, 141) then Draws a red circle centered at (280, 127) with radius 67.
; PLAN: r0=318(x), r1=38(y), r2=103(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x), r6=141(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=280(x), r11=127(y), r12=67(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 318
LDI r1, 38
LDI r2, 103
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 141
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 280
LDI r11, 127
LDI r12, 67
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
