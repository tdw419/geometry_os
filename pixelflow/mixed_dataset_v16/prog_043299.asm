; DESCRIPTION: Composite: Draws a cyan circle centered at (402, 47) with radius 42 then Draws a cyan rectangle at (267, 189) with width 74 and height 55 then Places a purple dot at position (111, 173).
; PLAN: r0=402(x), r1=47(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x), r6=189(y), r7=74(width), r8=55(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=111(x), r11=173(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 402
LDI r1, 47
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 189
LDI r7, 74
LDI r8, 55
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 173
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
