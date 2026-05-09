; DESCRIPTION: Composite: Places a black dot at position (439, 173) then Places a blue 16x113 rectangle at position (32, 98) then Draws a red circle centered at (335, 115) with radius 24.
; PLAN: r0=439(x), r1=173(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=32(x), r6=98(y), r7=16(width), r8=113(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=335(x), r11=115(y), r12=24(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 439
LDI r1, 173
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 32
LDI r6, 98
LDI r7, 16
LDI r8, 113
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 115
LDI r12, 24
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
