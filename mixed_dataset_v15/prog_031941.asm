; DESCRIPTION: Composite: Places a blue line segment connecting (154, 196) to (225, 61) then Draws a purple circle centered at (203, 73) with radius 20 then Places a yellow 21x105 rectangle at position (307, 19).
; PLAN: r0=154(x1), r1=196(y1), r2=225(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=203(x), r6=73(y), r7=20(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=307(x), r11=19(y), r12=21(width), r13=105(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 196
LDI r2, 225
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 73
LDI r7, 20
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 307
LDI r11, 19
LDI r12, 21
LDI r13, 105
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
