; DESCRIPTION: Composite: Places a white dot at position (275, 165) then Renders a cyan line between points (134, 61) and (449, 85) then Draws a magenta circle centered at (396, 167) with radius 70.
; PLAN: r0=275(x), r1=165(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=134(x1), r6=61(y1), r7=449(x2), r8=85(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=396(x), r11=167(y), r12=70(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 275
LDI r1, 165
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 134
LDI r6, 61
LDI r7, 449
LDI r8, 85
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 167
LDI r12, 70
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
