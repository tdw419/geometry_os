; DESCRIPTION: Composite: Renders a red box of size 114x105 starting at (283, 12) then Renders a yellow disk with center (341, 164) and radius 79 then Sets a single black pixel at (22, 161).
; PLAN: r0=283(x), r1=12(y), r2=114(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=341(x), r6=164(y), r7=79(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=22(x), r11=161(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 283
LDI r1, 12
LDI r2, 114
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 164
LDI r7, 79
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 22
LDI r11, 161
LDI r12, 0x000000
PSET r10, r11, r12
HALT
