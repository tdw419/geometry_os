; DESCRIPTION: Composite: Sets a single red pixel at (268, 75) then Draws a yellow circle centered at (165, 104) with radius 41 then Draws a blue rectangle at (186, 67) with width 83 and height 109.
; PLAN: r0=268(x), r1=75(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=104(y), r7=41(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=186(x), r11=67(y), r12=83(width), r13=109(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 75
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 165
LDI r6, 104
LDI r7, 41
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 186
LDI r11, 67
LDI r12, 83
LDI r13, 109
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
