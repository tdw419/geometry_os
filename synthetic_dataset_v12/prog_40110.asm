; DESCRIPTION: Composite: Draws a yellow rectangle at (45, 102) with width 98 and height 23 then Creates a cyan circular shape at (261, 39) with radius 22.
; PLAN: r0=45(x), r1=102(y), r2=98(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=261(x), r6=39(y), r7=22(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 45
LDI r1, 102
LDI r2, 98
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 39
LDI r7, 22
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
