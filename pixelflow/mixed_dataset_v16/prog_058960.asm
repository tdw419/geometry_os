; DESCRIPTION: Composite: Creates a red rectangular region at (416, 17) spanning 45 by 42 pixels then Renders a black disk with center (199, 234) and radius 19 then Draws a magenta line from (345, 3) to (410, 191).
; PLAN: r0=416(x), r1=17(y), r2=45(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=234(y), r7=19(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=345(x1), r11=3(y1), r12=410(x2), r13=191(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 416
LDI r1, 17
LDI r2, 45
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 234
LDI r7, 19
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 345
LDI r11, 3
LDI r12, 410
LDI r13, 191
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
