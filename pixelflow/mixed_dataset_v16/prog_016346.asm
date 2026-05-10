; DESCRIPTION: Composite: Creates a black circular shape at (240, 126) with radius 56 then Places a red 115x29 rectangle at position (304, 202) then Places a purple dot at position (273, 13).
; PLAN: r0=240(x), r1=126(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=304(x), r6=202(y), r7=115(width), r8=29(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=273(x), r11=13(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 240
LDI r1, 126
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 304
LDI r6, 202
LDI r7, 115
LDI r8, 29
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 13
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
