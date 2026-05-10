; DESCRIPTION: Composite: Places a black line segment connecting (501, 56) to (480, 112) then Creates a blue circular shape at (281, 197) with radius 33 then Renders a magenta box of size 74x42 starting at (134, 182).
; PLAN: r0=501(x1), r1=56(y1), r2=480(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=197(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=134(x), r11=182(y), r12=74(width), r13=42(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 501
LDI r1, 56
LDI r2, 480
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 197
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 134
LDI r11, 182
LDI r12, 74
LDI r13, 42
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
