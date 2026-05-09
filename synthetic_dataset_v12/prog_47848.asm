; DESCRIPTION: Composite: Places a yellow dot at position (155, 45) then Renders a yellow disk with center (416, 207) and radius 45 then Draws a green rectangle at (410, 213) with width 28 and height 38.
; PLAN: r0=155(x), r1=45(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=416(x), r6=207(y), r7=45(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=410(x), r11=213(y), r12=28(width), r13=38(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 45
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 416
LDI r6, 207
LDI r7, 45
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 410
LDI r11, 213
LDI r12, 28
LDI r13, 38
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
