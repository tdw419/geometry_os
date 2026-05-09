; DESCRIPTION: Composite: Draws a cyan rectangle at (195, 89) with width 120 and height 116 then Creates a blue circular shape at (339, 170) with radius 74 then Sets a single yellow pixel at (200, 210).
; PLAN: r0=195(x), r1=89(y), r2=120(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x), r6=170(y), r7=74(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=200(x), r11=210(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 195
LDI r1, 89
LDI r2, 120
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 170
LDI r7, 74
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 200
LDI r11, 210
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
