; DESCRIPTION: Composite: Places a red dot at position (161, 124) then Creates a magenta circular shape at (236, 83) with radius 69 then Draws a green rectangle at (27, 22) with width 115 and height 111.
; PLAN: r0=161(x), r1=124(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=236(x), r6=83(y), r7=69(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=27(x), r11=22(y), r12=115(width), r13=111(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 161
LDI r1, 124
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 236
LDI r6, 83
LDI r7, 69
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 27
LDI r11, 22
LDI r12, 115
LDI r13, 111
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
