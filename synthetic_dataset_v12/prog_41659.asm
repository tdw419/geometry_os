; DESCRIPTION: Composite: Draws a black rectangle at (293, 24) with width 62 and height 120 then Draws a yellow circle centered at (420, 94) with radius 20 then Sets a single white pixel at (174, 48).
; PLAN: r0=293(x), r1=24(y), r2=62(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x), r6=94(y), r7=20(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=174(x), r11=48(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 293
LDI r1, 24
LDI r2, 62
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 94
LDI r7, 20
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 174
LDI r11, 48
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
