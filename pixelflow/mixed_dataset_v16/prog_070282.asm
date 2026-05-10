; DESCRIPTION: Composite: Draws a magenta rectangle at (302, 233) with width 27 and height 15 then Places a magenta dot at position (13, 155) then Draws a cyan circle centered at (399, 171) with radius 42.
; PLAN: r0=302(x), r1=233(y), r2=27(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=13(x), r6=155(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=399(x), r11=171(y), r12=42(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 302
LDI r1, 233
LDI r2, 27
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 155
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 399
LDI r11, 171
LDI r12, 42
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
