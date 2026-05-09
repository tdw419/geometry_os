; DESCRIPTION: Composite: Places a green 33x67 rectangle at position (295, 163) then Sets a single white pixel at (262, 144) then Places a black circle of radius 20 at center (54, 101).
; PLAN: r0=295(x), r1=163(y), r2=33(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=262(x), r6=144(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=54(x), r11=101(y), r12=20(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 295
LDI r1, 163
LDI r2, 33
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 144
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 54
LDI r11, 101
LDI r12, 20
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
