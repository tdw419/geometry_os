; DESCRIPTION: Composite: Draws a purple rectangle at (274, 32) with width 68 and height 112 then Renders a magenta disk with center (169, 141) and radius 35 then Draws a cyan line from (223, 4) to (301, 173).
; PLAN: r0=274(x), r1=32(y), r2=68(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=169(x), r6=141(y), r7=35(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=223(x1), r11=4(y1), r12=301(x2), r13=173(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 32
LDI r2, 68
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 141
LDI r7, 35
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 223
LDI r11, 4
LDI r12, 301
LDI r13, 173
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
