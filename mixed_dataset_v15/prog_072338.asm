; DESCRIPTION: Composite: Creates a cyan circular shape at (109, 216) with radius 30 then Places a black 80x10 rectangle at position (207, 78) then Places a yellow dot at position (31, 121).
; PLAN: r0=109(x), r1=216(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x), r6=78(y), r7=80(width), r8=10(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=31(x), r11=121(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 109
LDI r1, 216
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 78
LDI r7, 80
LDI r8, 10
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 31
LDI r11, 121
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
