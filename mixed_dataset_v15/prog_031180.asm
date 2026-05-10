; DESCRIPTION: Composite: Places a magenta line segment connecting (126, 165) to (238, 249) then Creates a magenta circular shape at (326, 171) with radius 69 then Places a orange 45x72 rectangle at position (92, 152).
; PLAN: r0=126(x1), r1=165(y1), r2=238(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=171(y), r7=69(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=92(x), r11=152(y), r12=45(width), r13=72(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 126
LDI r1, 165
LDI r2, 238
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 171
LDI r7, 69
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 92
LDI r11, 152
LDI r12, 45
LDI r13, 72
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
