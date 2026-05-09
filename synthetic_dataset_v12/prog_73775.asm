; DESCRIPTION: Composite: Places a black circle of radius 73 at center (388, 93) then Draws a black rectangle at (176, 166) with width 105 and height 39 then Places a orange dot at position (313, 174).
; PLAN: r0=388(x), r1=93(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=176(x), r6=166(y), r7=105(width), r8=39(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=313(x), r11=174(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 388
LDI r1, 93
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 176
LDI r6, 166
LDI r7, 105
LDI r8, 39
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 174
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
