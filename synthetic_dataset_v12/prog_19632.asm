; DESCRIPTION: Composite: Draws a green circle centered at (437, 196) with radius 31 then Sets a single purple pixel at (164, 46) then Renders a yellow box of size 114x23 starting at (137, 81).
; PLAN: r0=437(x), r1=196(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x), r6=46(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=137(x), r11=81(y), r12=114(width), r13=23(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 437
LDI r1, 196
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 46
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 137
LDI r11, 81
LDI r12, 114
LDI r13, 23
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
