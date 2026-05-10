; DESCRIPTION: Composite: Places a yellow dot at position (480, 168) then Places a black 59x66 rectangle at position (138, 176) then Draws a yellow circle centered at (20, 119) with radius 18.
; PLAN: r0=480(x), r1=168(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=138(x), r6=176(y), r7=59(width), r8=66(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=20(x), r11=119(y), r12=18(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 480
LDI r1, 168
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 138
LDI r6, 176
LDI r7, 59
LDI r8, 66
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 20
LDI r11, 119
LDI r12, 18
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
