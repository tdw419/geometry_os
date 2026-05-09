; DESCRIPTION: Composite: Renders a magenta box of size 48x13 starting at (45, 228) then Draws a yellow circle centered at (85, 141) with radius 80 then Renders a yellow line between points (4, 53) and (9, 214).
; PLAN: r0=45(x), r1=228(y), r2=48(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x), r6=141(y), r7=80(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=4(x1), r11=53(y1), r12=9(x2), r13=214(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 45
LDI r1, 228
LDI r2, 48
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 141
LDI r7, 80
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 4
LDI r11, 53
LDI r12, 9
LDI r13, 214
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
