; DESCRIPTION: Composite: Draws a yellow circle centered at (121, 83) with radius 36 then Sets a single cyan pixel at (375, 138) then Creates a red rectangular region at (340, 87) spanning 18 by 96 pixels.
; PLAN: r0=121(x), r1=83(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=375(x), r6=138(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=340(x), r11=87(y), r12=18(width), r13=96(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 83
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 375
LDI r6, 138
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 340
LDI r11, 87
LDI r12, 18
LDI r13, 96
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
