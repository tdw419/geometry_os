; DESCRIPTION: Composite: Draws a white circle centered at (320, 78) with radius 51 then Places a white dot at position (49, 138) then Renders a cyan line between points (66, 63) and (32, 218).
; PLAN: r0=320(x), r1=78(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=138(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=66(x1), r11=63(y1), r12=32(x2), r13=218(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 320
LDI r1, 78
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 138
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 66
LDI r11, 63
LDI r12, 32
LDI r13, 218
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
