; DESCRIPTION: Composite: Places a yellow line segment connecting (171, 241) to (115, 220) then Places a blue circle of radius 71 at center (245, 78) then Draws a cyan rectangle at (160, 134) with width 86 and height 64.
; PLAN: r0=171(x1), r1=241(y1), r2=115(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=78(y), r7=71(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=160(x), r11=134(y), r12=86(width), r13=64(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 171
LDI r1, 241
LDI r2, 115
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 78
LDI r7, 71
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 160
LDI r11, 134
LDI r12, 86
LDI r13, 64
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
