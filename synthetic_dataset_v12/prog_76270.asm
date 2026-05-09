; DESCRIPTION: Composite: Draws a cyan circle centered at (259, 109) with radius 48 then Sets a single purple pixel at (455, 47) then Creates a white rectangular region at (54, 184) spanning 24 by 19 pixels.
; PLAN: r0=259(x), r1=109(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x), r6=47(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=54(x), r11=184(y), r12=24(width), r13=19(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 109
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 47
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 54
LDI r11, 184
LDI r12, 24
LDI r13, 19
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
