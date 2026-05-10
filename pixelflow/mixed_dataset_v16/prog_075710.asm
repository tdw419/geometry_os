; DESCRIPTION: Composite: Creates a blue rectangular region at (326, 95) spanning 47 by 66 pixels then Draws a black circle centered at (286, 59) with radius 54 then Places a white dot at position (12, 136).
; PLAN: r0=326(x), r1=95(y), r2=47(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=286(x), r6=59(y), r7=54(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=12(x), r11=136(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 326
LDI r1, 95
LDI r2, 47
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 59
LDI r7, 54
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 12
LDI r11, 136
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
