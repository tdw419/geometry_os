; DESCRIPTION: Composite: Renders a red disk with center (463, 153) and radius 42 then Draws a white rectangle at (291, 67) with width 65 and height 80 then Draws a orange line from (275, 245) to (437, 55).
; PLAN: r0=463(x), r1=153(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=291(x), r6=67(y), r7=65(width), r8=80(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=275(x1), r11=245(y1), r12=437(x2), r13=55(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 463
LDI r1, 153
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 291
LDI r6, 67
LDI r7, 65
LDI r8, 80
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 275
LDI r11, 245
LDI r12, 437
LDI r13, 55
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
