; DESCRIPTION: Composite: Places a purple dot at position (344, 149) then Places a blue 38x109 rectangle at position (336, 68) then Draws a red circle centered at (191, 124) with radius 49.
; PLAN: r0=344(x), r1=149(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=336(x), r6=68(y), r7=38(width), r8=109(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=191(x), r11=124(y), r12=49(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 344
LDI r1, 149
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 336
LDI r6, 68
LDI r7, 38
LDI r8, 109
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 191
LDI r11, 124
LDI r12, 49
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
