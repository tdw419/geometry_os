; DESCRIPTION: Composite: Draws a magenta circle centered at (73, 106) with radius 11 then Creates a blue rectangular region at (436, 89) spanning 32 by 32 pixels then Places a white dot at position (167, 27).
; PLAN: r0=73(x), r1=106(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x), r6=89(y), r7=32(width), r8=32(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=167(x), r11=27(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 73
LDI r1, 106
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 89
LDI r7, 32
LDI r8, 32
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 167
LDI r11, 27
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
