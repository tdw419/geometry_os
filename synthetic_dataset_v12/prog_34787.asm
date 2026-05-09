; DESCRIPTION: Composite: Renders a red box of size 13x118 starting at (117, 114) then Renders a orange disk with center (85, 66) and radius 52 then Sets a single blue pixel at (469, 67).
; PLAN: r0=117(x), r1=114(y), r2=13(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x), r6=66(y), r7=52(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=469(x), r11=67(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 117
LDI r1, 114
LDI r2, 13
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 66
LDI r7, 52
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 469
LDI r11, 67
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
