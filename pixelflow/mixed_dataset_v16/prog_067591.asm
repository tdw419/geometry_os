; DESCRIPTION: Composite: Renders a cyan box of size 63x101 starting at (183, 0) then Renders a green disk with center (325, 172) and radius 27 then Draws a yellow line from (419, 225) to (402, 53).
; PLAN: r0=183(x), r1=0(y), r2=63(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=325(x), r6=172(y), r7=27(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=419(x1), r11=225(y1), r12=402(x2), r13=53(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 0
LDI r2, 63
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 172
LDI r7, 27
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 419
LDI r11, 225
LDI r12, 402
LDI r13, 53
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
