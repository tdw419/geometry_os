; DESCRIPTION: Composite: Places a magenta circle of radius 14 at center (125, 210) then Places a red 70x42 rectangle at position (47, 20) then Sets a single black pixel at (107, 173).
; PLAN: r0=125(x), r1=210(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x), r6=20(y), r7=70(width), r8=42(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=107(x), r11=173(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 125
LDI r1, 210
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 20
LDI r7, 70
LDI r8, 42
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 173
LDI r12, 0x000000
PSET r10, r11, r12
HALT
