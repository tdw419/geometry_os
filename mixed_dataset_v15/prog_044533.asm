; DESCRIPTION: Composite: Creates a red rectangular region at (309, 5) spanning 95 by 75 pixels then Places a cyan dot at position (190, 210) then Draws a magenta circle centered at (42, 86) with radius 31.
; PLAN: r0=309(x), r1=5(y), r2=95(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=210(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=42(x), r11=86(y), r12=31(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 309
LDI r1, 5
LDI r2, 95
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 210
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 42
LDI r11, 86
LDI r12, 31
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
