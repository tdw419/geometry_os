; DESCRIPTION: Composite: Places a blue dot at position (129, 182) then Draws a red circle centered at (25, 200) with radius 11 then Places a blue 86x92 rectangle at position (295, 90).
; PLAN: r0=129(x), r1=182(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=25(x), r6=200(y), r7=11(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=295(x), r11=90(y), r12=86(width), r13=92(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 129
LDI r1, 182
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 25
LDI r6, 200
LDI r7, 11
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 295
LDI r11, 90
LDI r12, 86
LDI r13, 92
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
