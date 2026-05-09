; DESCRIPTION: Composite: Draws a green circle centered at (166, 98) with radius 56 then Places a red dot at position (499, 99) then Draws a blue rectangle at (360, 132) with width 70 and height 43.
; PLAN: r0=166(x), r1=98(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=499(x), r6=99(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=360(x), r11=132(y), r12=70(width), r13=43(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 98
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 499
LDI r6, 99
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 360
LDI r11, 132
LDI r12, 70
LDI r13, 43
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
