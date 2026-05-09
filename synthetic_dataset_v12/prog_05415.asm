; DESCRIPTION: Composite: Draws a magenta rectangle at (184, 86) with width 114 and height 18 then Sets a single red pixel at (333, 214) then Renders a yellow disk with center (380, 204) and radius 31.
; PLAN: r0=184(x), r1=86(y), r2=114(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x), r6=214(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=380(x), r11=204(y), r12=31(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 184
LDI r1, 86
LDI r2, 114
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 214
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 380
LDI r11, 204
LDI r12, 31
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
