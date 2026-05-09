; DESCRIPTION: Composite: Creates a white rectangular region at (176, 153) spanning 59 by 19 pixels then Places a purple dot at position (343, 242) then Draws a green circle centered at (327, 197) with radius 59.
; PLAN: r0=176(x), r1=153(y), r2=59(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=343(x), r6=242(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=327(x), r11=197(y), r12=59(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 176
LDI r1, 153
LDI r2, 59
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 242
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 327
LDI r11, 197
LDI r12, 59
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
