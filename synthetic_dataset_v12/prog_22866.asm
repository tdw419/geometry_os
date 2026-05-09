; DESCRIPTION: Composite: Creates a green circular shape at (70, 93) with radius 58 then Places a black 102x59 rectangle at position (20, 87) then Places a cyan dot at position (126, 41).
; PLAN: r0=70(x), r1=93(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=87(y), r7=102(width), r8=59(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=126(x), r11=41(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 70
LDI r1, 93
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 87
LDI r7, 102
LDI r8, 59
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 41
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
