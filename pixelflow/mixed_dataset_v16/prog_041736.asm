; DESCRIPTION: Composite: Sets a single orange pixel at (102, 53) then Draws a red circle centered at (127, 44) with radius 24 then Places a red 37x92 rectangle at position (459, 40).
; PLAN: r0=102(x), r1=53(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=44(y), r7=24(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=459(x), r11=40(y), r12=37(width), r13=92(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 53
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 127
LDI r6, 44
LDI r7, 24
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 459
LDI r11, 40
LDI r12, 37
LDI r13, 92
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
