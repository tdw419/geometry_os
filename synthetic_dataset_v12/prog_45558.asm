; DESCRIPTION: Composite: Creates a blue circular shape at (361, 39) with radius 39 then Creates a magenta rectangular region at (221, 83) spanning 39 by 35 pixels then Places a magenta dot at position (88, 209).
; PLAN: r0=361(x), r1=39(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x), r6=83(y), r7=39(width), r8=35(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=88(x), r11=209(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 361
LDI r1, 39
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 83
LDI r7, 39
LDI r8, 35
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 209
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
