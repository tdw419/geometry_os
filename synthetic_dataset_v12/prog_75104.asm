; DESCRIPTION: Composite: Places a magenta 29x76 rectangle at position (169, 67) then Places a red circle of radius 57 at center (181, 191) then Draws a red line from (51, 60) to (461, 8).
; PLAN: r0=169(x), r1=67(y), r2=29(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=181(x), r6=191(y), r7=57(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=51(x1), r11=60(y1), r12=461(x2), r13=8(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 169
LDI r1, 67
LDI r2, 29
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 191
LDI r7, 57
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 51
LDI r11, 60
LDI r12, 461
LDI r13, 8
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
