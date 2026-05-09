; DESCRIPTION: Composite: Draws a green circle centered at (407, 121) with radius 78 then Places a orange dot at position (369, 81) then Renders a red box of size 52x74 starting at (187, 83).
; PLAN: r0=407(x), r1=121(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=369(x), r6=81(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=187(x), r11=83(y), r12=52(width), r13=74(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 407
LDI r1, 121
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 369
LDI r6, 81
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 187
LDI r11, 83
LDI r12, 52
LDI r13, 74
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
