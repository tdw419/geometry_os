; DESCRIPTION: Composite: Creates a cyan circular shape at (207, 230) with radius 17 then Creates a orange rectangular region at (244, 33) spanning 120 by 117 pixels then Places a magenta dot at position (75, 131).
; PLAN: r0=207(x), r1=230(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=244(x), r6=33(y), r7=120(width), r8=117(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=75(x), r11=131(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 207
LDI r1, 230
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 244
LDI r6, 33
LDI r7, 120
LDI r8, 117
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 131
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
