; DESCRIPTION: Composite: Renders a yellow line between points (461, 101) and (365, 175) then Sets a single green pixel at (285, 191) then Draws a magenta rectangle at (424, 98) with width 74 and height 27.
; PLAN: r0=461(x1), r1=101(y1), r2=365(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=285(x), r6=191(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=424(x), r11=98(y), r12=74(width), r13=27(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 101
LDI r2, 365
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 191
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 424
LDI r11, 98
LDI r12, 74
LDI r13, 27
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
