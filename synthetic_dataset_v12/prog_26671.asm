; DESCRIPTION: Composite: Creates a red circular shape at (116, 18) with radius 13 then Draws a yellow line from (299, 157) to (402, 111) then Renders a purple box of size 119x21 starting at (324, 138).
; PLAN: r0=116(x), r1=18(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x1), r6=157(y1), r7=402(x2), r8=111(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=324(x), r11=138(y), r12=119(width), r13=21(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 18
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 157
LDI r7, 402
LDI r8, 111
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 324
LDI r11, 138
LDI r12, 119
LDI r13, 21
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
