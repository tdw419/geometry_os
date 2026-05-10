; DESCRIPTION: Composite: Draws a black rectangle at (130, 74) with width 93 and height 113 then Draws a cyan circle centered at (460, 59) with radius 29 then Places a orange dot at position (445, 102).
; PLAN: r0=130(x), r1=74(y), r2=93(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=460(x), r6=59(y), r7=29(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=445(x), r11=102(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 130
LDI r1, 74
LDI r2, 93
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 59
LDI r7, 29
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 445
LDI r11, 102
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
