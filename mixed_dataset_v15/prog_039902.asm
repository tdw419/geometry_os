; DESCRIPTION: Composite: Creates a magenta circular shape at (117, 69) with radius 52 then Draws a cyan rectangle at (251, 90) with width 39 and height 15 then Sets a single yellow pixel at (99, 238).
; PLAN: r0=117(x), r1=69(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=90(y), r7=39(width), r8=15(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=99(x), r11=238(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 117
LDI r1, 69
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 90
LDI r7, 39
LDI r8, 15
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 238
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
