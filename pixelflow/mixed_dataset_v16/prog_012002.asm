; DESCRIPTION: Composite: Places a blue dot at position (288, 155) then Creates a blue circular shape at (341, 144) with radius 70 then Places a magenta 59x27 rectangle at position (125, 7).
; PLAN: r0=288(x), r1=155(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=144(y), r7=70(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=125(x), r11=7(y), r12=59(width), r13=27(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 155
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 341
LDI r6, 144
LDI r7, 70
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 125
LDI r11, 7
LDI r12, 59
LDI r13, 27
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
