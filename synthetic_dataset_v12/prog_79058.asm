; DESCRIPTION: Composite: Places a cyan circle of radius 72 at center (309, 78) then Places a magenta 12x50 rectangle at position (14, 109) then Places a white dot at position (179, 112).
; PLAN: r0=309(x), r1=78(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x), r6=109(y), r7=12(width), r8=50(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=179(x), r11=112(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 309
LDI r1, 78
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 109
LDI r7, 12
LDI r8, 50
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 112
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
