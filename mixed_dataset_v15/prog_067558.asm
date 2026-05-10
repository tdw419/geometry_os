; DESCRIPTION: Composite: Creates a magenta circular shape at (406, 114) with radius 17 then Draws a cyan rectangle at (235, 129) with width 11 and height 115 then Places a yellow line segment connecting (128, 247) to (437, 250).
; PLAN: r0=406(x), r1=114(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=129(y), r7=11(width), r8=115(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=128(x1), r11=247(y1), r12=437(x2), r13=250(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 406
LDI r1, 114
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 129
LDI r7, 11
LDI r8, 115
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 128
LDI r11, 247
LDI r12, 437
LDI r13, 250
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
