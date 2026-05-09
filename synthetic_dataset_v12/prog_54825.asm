; DESCRIPTION: Composite: Creates a black circular shape at (327, 113) with radius 37 then Sets a single black pixel at (97, 84) then Renders a magenta box of size 46x48 starting at (377, 27).
; PLAN: r0=327(x), r1=113(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=97(x), r6=84(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=377(x), r11=27(y), r12=46(width), r13=48(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 327
LDI r1, 113
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 97
LDI r6, 84
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 377
LDI r11, 27
LDI r12, 46
LDI r13, 48
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
