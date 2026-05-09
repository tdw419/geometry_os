; DESCRIPTION: Composite: Places a yellow 43x32 rectangle at position (78, 189) then Creates a white circular shape at (223, 155) with radius 78 then Places a yellow dot at position (207, 154).
; PLAN: r0=78(x), r1=189(y), r2=43(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=223(x), r6=155(y), r7=78(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=207(x), r11=154(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 78
LDI r1, 189
LDI r2, 43
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 155
LDI r7, 78
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 207
LDI r11, 154
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
