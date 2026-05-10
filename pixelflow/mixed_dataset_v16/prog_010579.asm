; DESCRIPTION: Composite: Places a white line segment connecting (509, 124) to (340, 216) then Sets a single orange pixel at (402, 62) then Draws a red rectangle at (25, 105) with width 86 and height 28.
; PLAN: r0=509(x1), r1=124(y1), r2=340(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=62(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=25(x), r11=105(y), r12=86(width), r13=28(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 509
LDI r1, 124
LDI r2, 340
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 62
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 25
LDI r11, 105
LDI r12, 86
LDI r13, 28
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
