; DESCRIPTION: Composite: Places a red dot at position (504, 191) then Draws a magenta rectangle at (261, 72) with width 104 and height 112 then Renders a blue disk with center (367, 103) and radius 74.
; PLAN: r0=504(x), r1=191(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=261(x), r6=72(y), r7=104(width), r8=112(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=367(x), r11=103(y), r12=74(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 504
LDI r1, 191
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 261
LDI r6, 72
LDI r7, 104
LDI r8, 112
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 103
LDI r12, 74
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
