; DESCRIPTION: Composite: Draws a blue circle centered at (208, 83) with radius 63 then Creates a red rectangular region at (259, 42) spanning 40 by 29 pixels then Places a green dot at position (313, 30).
; PLAN: r0=208(x), r1=83(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=259(x), r6=42(y), r7=40(width), r8=29(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=313(x), r11=30(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 208
LDI r1, 83
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 259
LDI r6, 42
LDI r7, 40
LDI r8, 29
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 30
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
