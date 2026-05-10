; DESCRIPTION: Composite: Draws a magenta circle centered at (232, 98) with radius 79 then Places a cyan 95x101 rectangle at position (297, 146) then Places a white dot at position (45, 29).
; PLAN: r0=232(x), r1=98(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=297(x), r6=146(y), r7=95(width), r8=101(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=45(x), r11=29(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 232
LDI r1, 98
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 297
LDI r6, 146
LDI r7, 95
LDI r8, 101
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 29
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
