; DESCRIPTION: Composite: Draws a cyan circle centered at (393, 63) with radius 61 then Creates a blue rectangular region at (9, 83) spanning 71 by 36 pixels then Places a magenta dot at position (319, 253).
; PLAN: r0=393(x), r1=63(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=9(x), r6=83(y), r7=71(width), r8=36(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=319(x), r11=253(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 393
LDI r1, 63
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 9
LDI r6, 83
LDI r7, 71
LDI r8, 36
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 253
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
