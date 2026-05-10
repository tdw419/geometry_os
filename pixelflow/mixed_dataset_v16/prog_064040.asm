; DESCRIPTION: Composite: Places a orange dot at position (51, 208) then Draws a green rectangle at (113, 153) with width 104 and height 86 then Places a green circle of radius 60 at center (251, 155).
; PLAN: r0=51(x), r1=208(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=113(x), r6=153(y), r7=104(width), r8=86(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=251(x), r11=155(y), r12=60(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 51
LDI r1, 208
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 113
LDI r6, 153
LDI r7, 104
LDI r8, 86
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 155
LDI r12, 60
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
