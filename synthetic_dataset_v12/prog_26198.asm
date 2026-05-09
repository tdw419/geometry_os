; DESCRIPTION: Composite: Places a blue 76x61 rectangle at position (59, 172) then Places a cyan dot at position (45, 134) then Creates a black circular shape at (138, 44) with radius 42.
; PLAN: r0=59(x), r1=172(y), r2=76(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x), r6=134(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=138(x), r11=44(y), r12=42(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 59
LDI r1, 172
LDI r2, 76
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 134
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 138
LDI r11, 44
LDI r12, 42
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
