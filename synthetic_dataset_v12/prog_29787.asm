; DESCRIPTION: Composite: Creates a yellow circular shape at (333, 54) with radius 36 then Draws a cyan rectangle at (473, 130) with width 38 and height 102 then Places a black dot at position (280, 118).
; PLAN: r0=333(x), r1=54(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=473(x), r6=130(y), r7=38(width), r8=102(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=280(x), r11=118(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 333
LDI r1, 54
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 473
LDI r6, 130
LDI r7, 38
LDI r8, 102
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 118
LDI r12, 0x000000
PSET r10, r11, r12
HALT
