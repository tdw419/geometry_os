; DESCRIPTION: Composite: Creates a cyan rectangular region at (229, 179) spanning 14 by 59 pixels then Draws a blue circle centered at (396, 102) with radius 72 then Places a magenta dot at position (309, 255).
; PLAN: r0=229(x), r1=179(y), r2=14(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=396(x), r6=102(y), r7=72(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=309(x), r11=255(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 229
LDI r1, 179
LDI r2, 14
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 102
LDI r7, 72
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 309
LDI r11, 255
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
