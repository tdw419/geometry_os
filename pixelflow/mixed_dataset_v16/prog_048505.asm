; DESCRIPTION: Composite: Places a white dot at position (393, 95) then Creates a white circular shape at (395, 98) with radius 30 then Renders a blue box of size 94x78 starting at (185, 175).
; PLAN: r0=393(x), r1=95(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=395(x), r6=98(y), r7=30(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=185(x), r11=175(y), r12=94(width), r13=78(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 393
LDI r1, 95
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 395
LDI r6, 98
LDI r7, 30
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 185
LDI r11, 175
LDI r12, 94
LDI r13, 78
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
