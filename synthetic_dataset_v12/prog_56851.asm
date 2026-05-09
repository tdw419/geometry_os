; DESCRIPTION: Composite: Draws a green rectangle at (285, 128) with width 94 and height 49 then Creates a cyan circular shape at (465, 210) with radius 11.
; PLAN: r0=285(x), r1=128(y), r2=94(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=465(x), r6=210(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 285
LDI r1, 128
LDI r2, 94
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 210
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
