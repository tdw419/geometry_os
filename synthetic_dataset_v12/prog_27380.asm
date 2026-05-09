; DESCRIPTION: Composite: Places a magenta 36x48 rectangle at position (347, 98) then Creates a yellow circular shape at (93, 176) with radius 73 then Places a blue dot at position (64, 57).
; PLAN: r0=347(x), r1=98(y), r2=36(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=176(y), r7=73(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=64(x), r11=57(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 347
LDI r1, 98
LDI r2, 36
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 176
LDI r7, 73
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 64
LDI r11, 57
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
