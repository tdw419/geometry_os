; DESCRIPTION: Composite: Creates a black circular shape at (363, 178) with radius 70 then Places a black 87x117 rectangle at position (108, 96) then Places a white dot at position (438, 251).
; PLAN: r0=363(x), r1=178(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x), r6=96(y), r7=87(width), r8=117(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=438(x), r11=251(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 363
LDI r1, 178
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 96
LDI r7, 87
LDI r8, 117
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 251
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
