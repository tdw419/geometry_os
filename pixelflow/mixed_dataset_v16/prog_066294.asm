; DESCRIPTION: Composite: Creates a black circular shape at (339, 27) with radius 23 then Places a yellow line segment connecting (275, 215) to (266, 59) then Draws a magenta rectangle at (245, 10) with width 60 and height 43.
; PLAN: r0=339(x), r1=27(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=275(x1), r6=215(y1), r7=266(x2), r8=59(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=245(x), r11=10(y), r12=60(width), r13=43(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 339
LDI r1, 27
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 275
LDI r6, 215
LDI r7, 266
LDI r8, 59
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 10
LDI r12, 60
LDI r13, 43
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
