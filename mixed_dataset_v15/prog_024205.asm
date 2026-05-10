; DESCRIPTION: Composite: Draws a orange rectangle at (94, 34) with width 77 and height 52 then Creates a cyan circular shape at (124, 191) with radius 63 then Renders a green line between points (338, 255) and (430, 24).
; PLAN: r0=94(x), r1=34(y), r2=77(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=124(x), r6=191(y), r7=63(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=338(x1), r11=255(y1), r12=430(x2), r13=24(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 34
LDI r2, 77
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 191
LDI r7, 63
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 338
LDI r11, 255
LDI r12, 430
LDI r13, 24
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
