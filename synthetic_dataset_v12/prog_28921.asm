; DESCRIPTION: Composite: Sets a single yellow pixel at (138, 39) then Places a purple circle of radius 76 at center (425, 111) then Draws a orange rectangle at (27, 209) with width 114 and height 12.
; PLAN: r0=138(x), r1=39(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=425(x), r6=111(y), r7=76(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=27(x), r11=209(y), r12=114(width), r13=12(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 39
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 425
LDI r6, 111
LDI r7, 76
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 27
LDI r11, 209
LDI r12, 114
LDI r13, 12
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
