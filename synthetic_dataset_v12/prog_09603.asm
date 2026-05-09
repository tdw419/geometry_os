; DESCRIPTION: Composite: Places a black dot at position (129, 241) then Draws a black rectangle at (152, 65) with width 112 and height 100 then Creates a green circular shape at (460, 186) with radius 10.
; PLAN: r0=129(x), r1=241(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=152(x), r6=65(y), r7=112(width), r8=100(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=460(x), r11=186(y), r12=10(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 129
LDI r1, 241
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 152
LDI r6, 65
LDI r7, 112
LDI r8, 100
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 460
LDI r11, 186
LDI r12, 10
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
