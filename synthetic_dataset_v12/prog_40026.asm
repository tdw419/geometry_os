; DESCRIPTION: Composite: Creates a orange circular shape at (395, 89) with radius 17 then Draws a cyan rectangle at (132, 16) with width 93 and height 98.
; PLAN: r0=395(x), r1=89(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=16(y), r7=93(width), r8=98(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 89
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 16
LDI r7, 93
LDI r8, 98
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
