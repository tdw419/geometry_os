; DESCRIPTION: Composite: Places a green dot at position (257, 116) then Creates a red rectangular region at (42, 119) spanning 113 by 12 pixels then Places a red circle of radius 29 at center (432, 109).
; PLAN: r0=257(x), r1=116(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=42(x), r6=119(y), r7=113(width), r8=12(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=432(x), r11=109(y), r12=29(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 257
LDI r1, 116
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 42
LDI r6, 119
LDI r7, 113
LDI r8, 12
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 432
LDI r11, 109
LDI r12, 29
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
