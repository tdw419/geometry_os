; DESCRIPTION: Composite: Renders a orange line between points (18, 148) and (441, 242) then Creates a magenta circular shape at (111, 87) with radius 65 then Draws a black rectangle at (235, 139) with width 27 and height 111.
; PLAN: r0=18(x1), r1=148(y1), r2=441(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=87(y), r7=65(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=235(x), r11=139(y), r12=27(width), r13=111(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 18
LDI r1, 148
LDI r2, 441
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 87
LDI r7, 65
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 235
LDI r11, 139
LDI r12, 27
LDI r13, 111
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
