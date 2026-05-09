; DESCRIPTION: Composite: Sets a single black pixel at (65, 85) then Places a yellow 71x21 rectangle at position (231, 210) then Creates a magenta circular shape at (422, 163) with radius 34.
; PLAN: r0=65(x), r1=85(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=231(x), r6=210(y), r7=71(width), r8=21(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=422(x), r11=163(y), r12=34(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 65
LDI r1, 85
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 231
LDI r6, 210
LDI r7, 71
LDI r8, 21
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 163
LDI r12, 34
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
