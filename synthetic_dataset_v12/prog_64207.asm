; DESCRIPTION: Composite: Draws a green rectangle at (248, 136) with width 33 and height 59 then Places a orange dot at position (258, 253).
; PLAN: r0=248(x), r1=136(y), r2=33(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x), r6=253(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 248
LDI r1, 136
LDI r2, 33
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 253
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
