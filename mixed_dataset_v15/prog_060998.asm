; DESCRIPTION: Composite: Places a green 99x106 rectangle at position (76, 1) then Places a green dot at position (69, 238) then Renders a white disk with center (408, 75) and radius 57.
; PLAN: r0=76(x), r1=1(y), r2=99(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x), r6=238(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=408(x), r11=75(y), r12=57(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 76
LDI r1, 1
LDI r2, 99
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 238
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 408
LDI r11, 75
LDI r12, 57
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
