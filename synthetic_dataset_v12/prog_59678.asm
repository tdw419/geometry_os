; DESCRIPTION: Composite: Places a green 75x63 rectangle at position (87, 71) then Places a cyan dot at position (302, 167) then Draws a green circle centered at (178, 138) with radius 20.
; PLAN: r0=87(x), r1=71(y), r2=75(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=302(x), r6=167(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=178(x), r11=138(y), r12=20(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 87
LDI r1, 71
LDI r2, 75
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 167
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 178
LDI r11, 138
LDI r12, 20
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
