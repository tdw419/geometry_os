; DESCRIPTION: Composite: Draws a cyan line from (14, 37) to (357, 97) then Draws a green circle centered at (187, 172) with radius 10 then Draws a yellow rectangle at (231, 11) with width 42 and height 20.
; PLAN: r0=14(x1), r1=37(y1), r2=357(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=187(x), r6=172(y), r7=10(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=231(x), r11=11(y), r12=42(width), r13=20(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 14
LDI r1, 37
LDI r2, 357
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 172
LDI r7, 10
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 231
LDI r11, 11
LDI r12, 42
LDI r13, 20
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
