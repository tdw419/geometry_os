; DESCRIPTION: Composite: Creates a magenta circular shape at (229, 197) with radius 27 then Places a black 107x17 rectangle at position (109, 20) then Places a red dot at position (24, 116).
; PLAN: r0=229(x), r1=197(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=20(y), r7=107(width), r8=17(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=24(x), r11=116(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 229
LDI r1, 197
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 20
LDI r7, 107
LDI r8, 17
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 24
LDI r11, 116
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
