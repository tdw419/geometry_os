; DESCRIPTION: Composite: Creates a red circular shape at (440, 86) with radius 42 then Draws a cyan rectangle at (118, 22) with width 101 and height 50.
; PLAN: r0=440(x), r1=86(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x), r6=22(y), r7=101(width), r8=50(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 440
LDI r1, 86
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 22
LDI r7, 101
LDI r8, 50
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
