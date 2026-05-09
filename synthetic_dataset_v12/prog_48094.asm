; DESCRIPTION: Composite: Sets a single red pixel at (379, 214) then Draws a cyan circle centered at (153, 187) with radius 65 then Creates a red rectangular region at (306, 66) spanning 28 by 53 pixels.
; PLAN: r0=379(x), r1=214(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=153(x), r6=187(y), r7=65(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x), r11=66(y), r12=28(width), r13=53(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 379
LDI r1, 214
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 153
LDI r6, 187
LDI r7, 65
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 66
LDI r12, 28
LDI r13, 53
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
