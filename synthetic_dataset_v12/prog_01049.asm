; DESCRIPTION: Composite: Places a purple line segment connecting (140, 118) to (493, 235) then Creates a yellow circular shape at (128, 98) with radius 29 then Renders a black box of size 49x19 starting at (282, 65).
; PLAN: r0=140(x1), r1=118(y1), r2=493(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=98(y), r7=29(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=282(x), r11=65(y), r12=49(width), r13=19(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 140
LDI r1, 118
LDI r2, 493
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 98
LDI r7, 29
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 282
LDI r11, 65
LDI r12, 49
LDI r13, 19
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
