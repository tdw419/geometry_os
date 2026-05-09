; DESCRIPTION: Composite: Places a cyan dot at position (280, 163) then Places a purple circle of radius 50 at center (451, 166) then Draws a purple rectangle at (407, 47) with width 12 and height 56.
; PLAN: r0=280(x), r1=163(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=451(x), r6=166(y), r7=50(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=407(x), r11=47(y), r12=12(width), r13=56(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 163
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 451
LDI r6, 166
LDI r7, 50
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 407
LDI r11, 47
LDI r12, 12
LDI r13, 56
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
