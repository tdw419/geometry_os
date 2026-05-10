; DESCRIPTION: Composite: Draws a black line from (205, 254) to (191, 136) then Places a magenta circle of radius 23 at center (68, 103) then Places a cyan 117x13 rectangle at position (203, 8).
; PLAN: r0=205(x1), r1=254(y1), r2=191(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=103(y), r7=23(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=203(x), r11=8(y), r12=117(width), r13=13(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 254
LDI r2, 191
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 103
LDI r7, 23
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 203
LDI r11, 8
LDI r12, 117
LDI r13, 13
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
