; DESCRIPTION: Composite: Places a magenta circle of radius 76 at center (287, 134) then Draws a red rectangle at (388, 71) with width 19 and height 80 then Places a black dot at position (509, 126).
; PLAN: r0=287(x), r1=134(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=388(x), r6=71(y), r7=19(width), r8=80(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=509(x), r11=126(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 287
LDI r1, 134
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 388
LDI r6, 71
LDI r7, 19
LDI r8, 80
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 509
LDI r11, 126
LDI r12, 0x000000
PSET r10, r11, r12
HALT
