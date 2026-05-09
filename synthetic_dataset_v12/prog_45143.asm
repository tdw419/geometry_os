; DESCRIPTION: Composite: Places a magenta line segment connecting (92, 183) to (404, 102) then Creates a orange circular shape at (178, 137) with radius 46 then Places a black 114x72 rectangle at position (193, 87).
; PLAN: r0=92(x1), r1=183(y1), r2=404(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=137(y), r7=46(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=193(x), r11=87(y), r12=114(width), r13=72(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 92
LDI r1, 183
LDI r2, 404
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 137
LDI r7, 46
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 193
LDI r11, 87
LDI r12, 114
LDI r13, 72
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
