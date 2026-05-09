; DESCRIPTION: Composite: Draws a green rectangle at (218, 26) with width 28 and height 53 then Places a purple dot at position (124, 166) then Draws a black circle centered at (210, 138) with radius 59.
; PLAN: r0=218(x), r1=26(y), r2=28(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=124(x), r6=166(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=210(x), r11=138(y), r12=59(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 218
LDI r1, 26
LDI r2, 28
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 166
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 210
LDI r11, 138
LDI r12, 59
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
