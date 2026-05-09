; DESCRIPTION: Composite: Sets a single blue pixel at (265, 153) then Draws a red circle centered at (117, 124) with radius 56 then Renders a white box of size 80x98 starting at (129, 56).
; PLAN: r0=265(x), r1=153(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=117(x), r6=124(y), r7=56(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=129(x), r11=56(y), r12=80(width), r13=98(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 153
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 117
LDI r6, 124
LDI r7, 56
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 129
LDI r11, 56
LDI r12, 80
LDI r13, 98
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
