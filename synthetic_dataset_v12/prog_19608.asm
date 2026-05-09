; DESCRIPTION: Composite: Places a red dot at position (439, 147) then Creates a blue circular shape at (87, 174) with radius 10 then Draws a magenta rectangle at (241, 98) with width 89 and height 42.
; PLAN: r0=439(x), r1=147(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=87(x), r6=174(y), r7=10(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=241(x), r11=98(y), r12=89(width), r13=42(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 439
LDI r1, 147
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 87
LDI r6, 174
LDI r7, 10
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 241
LDI r11, 98
LDI r12, 89
LDI r13, 42
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
