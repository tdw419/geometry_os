; DESCRIPTION: Composite: Sets a single yellow pixel at (193, 164) then Draws a green circle centered at (466, 100) with radius 29 then Draws a white rectangle at (343, 91) with width 11 and height 25.
; PLAN: r0=193(x), r1=164(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=466(x), r6=100(y), r7=29(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=343(x), r11=91(y), r12=11(width), r13=25(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 164
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 466
LDI r6, 100
LDI r7, 29
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 343
LDI r11, 91
LDI r12, 11
LDI r13, 25
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
