; DESCRIPTION: Composite: Sets a single blue pixel at (220, 44) then Places a red 89x16 rectangle at position (414, 71) then Draws a purple circle centered at (425, 42) with radius 40.
; PLAN: r0=220(x), r1=44(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=414(x), r6=71(y), r7=89(width), r8=16(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=425(x), r11=42(y), r12=40(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 220
LDI r1, 44
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 414
LDI r6, 71
LDI r7, 89
LDI r8, 16
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 42
LDI r12, 40
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
