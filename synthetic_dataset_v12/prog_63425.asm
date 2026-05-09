; DESCRIPTION: Composite: Places a red dot at position (1, 96) then Places a black circle of radius 43 at center (336, 90) then Draws a orange rectangle at (208, 47) with width 75 and height 64.
; PLAN: r0=1(x), r1=96(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=336(x), r6=90(y), r7=43(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=208(x), r11=47(y), r12=75(width), r13=64(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 1
LDI r1, 96
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 336
LDI r6, 90
LDI r7, 43
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 208
LDI r11, 47
LDI r12, 75
LDI r13, 64
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
