; DESCRIPTION: Composite: Places a white 21x60 rectangle at position (127, 29) then Renders a purple disk with center (128, 183) and radius 46 then Places a orange line segment connecting (239, 201) to (223, 20).
; PLAN: r0=127(x), r1=29(y), r2=21(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=128(x), r6=183(y), r7=46(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=239(x1), r11=201(y1), r12=223(x2), r13=20(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 29
LDI r2, 21
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 183
LDI r7, 46
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 239
LDI r11, 201
LDI r12, 223
LDI r13, 20
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
