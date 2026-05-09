; DESCRIPTION: Composite: Places a magenta line segment connecting (143, 126) to (189, 48) then Draws a magenta circle centered at (256, 65) with radius 43 then Places a magenta 15x90 rectangle at position (40, 85).
; PLAN: r0=143(x1), r1=126(y1), r2=189(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=256(x), r6=65(y), r7=43(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=40(x), r11=85(y), r12=15(width), r13=90(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 126
LDI r2, 189
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 65
LDI r7, 43
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 40
LDI r11, 85
LDI r12, 15
LDI r13, 90
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
