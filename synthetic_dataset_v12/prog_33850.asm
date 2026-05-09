; DESCRIPTION: Composite: Places a white dot at position (84, 173) then Creates a yellow circular shape at (390, 89) with radius 74 then Places a blue 56x19 rectangle at position (158, 196).
; PLAN: r0=84(x), r1=173(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=390(x), r6=89(y), r7=74(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=158(x), r11=196(y), r12=56(width), r13=19(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 84
LDI r1, 173
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 390
LDI r6, 89
LDI r7, 74
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 158
LDI r11, 196
LDI r12, 56
LDI r13, 19
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
