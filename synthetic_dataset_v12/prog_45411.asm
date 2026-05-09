; DESCRIPTION: Composite: Sets a single orange pixel at (137, 137) then Renders a white disk with center (473, 225) and radius 24 then Draws a cyan rectangle at (356, 91) with width 59 and height 114.
; PLAN: r0=137(x), r1=137(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=473(x), r6=225(y), r7=24(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=356(x), r11=91(y), r12=59(width), r13=114(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 137
LDI r1, 137
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 473
LDI r6, 225
LDI r7, 24
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 356
LDI r11, 91
LDI r12, 59
LDI r13, 114
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
