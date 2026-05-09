; DESCRIPTION: Composite: Draws a cyan circle centered at (423, 41) with radius 36 then Draws a yellow rectangle at (12, 68) with width 37 and height 48 then Renders a magenta line between points (12, 43) and (284, 70).
; PLAN: r0=423(x), r1=41(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x), r6=68(y), r7=37(width), r8=48(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=12(x1), r11=43(y1), r12=284(x2), r13=70(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 41
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 68
LDI r7, 37
LDI r8, 48
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 12
LDI r11, 43
LDI r12, 284
LDI r13, 70
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
