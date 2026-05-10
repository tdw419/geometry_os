; DESCRIPTION: Composite: Places a orange 82x83 rectangle at position (66, 61) then Creates a yellow circular shape at (156, 134) with radius 38 then Sets a single red pixel at (467, 10).
; PLAN: r0=66(x), r1=61(y), r2=82(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=134(y), r7=38(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=467(x), r11=10(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 66
LDI r1, 61
LDI r2, 82
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 134
LDI r7, 38
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 467
LDI r11, 10
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
