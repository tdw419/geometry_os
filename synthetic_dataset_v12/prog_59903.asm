; DESCRIPTION: Composite: Places a black 49x99 rectangle at position (463, 153) then Renders a purple disk with center (179, 144) and radius 17 then Places a green line segment connecting (485, 234) to (280, 204).
; PLAN: r0=463(x), r1=153(y), r2=49(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=179(x), r6=144(y), r7=17(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=485(x1), r11=234(y1), r12=280(x2), r13=204(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 463
LDI r1, 153
LDI r2, 49
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 144
LDI r7, 17
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 485
LDI r11, 234
LDI r12, 280
LDI r13, 204
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
