; DESCRIPTION: Composite: Places a magenta dot at position (284, 60) then Creates a white rectangular region at (225, 138) spanning 106 by 113 pixels then Draws a green circle centered at (356, 170) with radius 53.
; PLAN: r0=284(x), r1=60(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=225(x), r6=138(y), r7=106(width), r8=113(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=356(x), r11=170(y), r12=53(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 284
LDI r1, 60
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 225
LDI r6, 138
LDI r7, 106
LDI r8, 113
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 170
LDI r12, 53
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
