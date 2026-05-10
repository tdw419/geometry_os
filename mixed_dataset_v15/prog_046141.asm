; DESCRIPTION: Composite: Places a white dot at position (457, 186) then Places a cyan circle of radius 27 at center (169, 226) then Draws a purple rectangle at (254, 124) with width 19 and height 110.
; PLAN: r0=457(x), r1=186(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=226(y), r7=27(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=254(x), r11=124(y), r12=19(width), r13=110(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 457
LDI r1, 186
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 169
LDI r6, 226
LDI r7, 27
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 254
LDI r11, 124
LDI r12, 19
LDI r13, 110
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
