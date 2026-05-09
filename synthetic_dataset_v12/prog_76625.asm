; DESCRIPTION: Composite: Creates a orange circular shape at (319, 198) with radius 34 then Sets a single magenta pixel at (175, 219) then Renders a magenta box of size 62x113 starting at (12, 89).
; PLAN: r0=319(x), r1=198(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=175(x), r6=219(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=12(x), r11=89(y), r12=62(width), r13=113(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 198
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 175
LDI r6, 219
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 12
LDI r11, 89
LDI r12, 62
LDI r13, 113
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
