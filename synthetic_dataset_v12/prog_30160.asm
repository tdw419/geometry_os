; DESCRIPTION: Composite: Places a orange 11x87 rectangle at position (28, 105) then Draws a yellow line from (258, 38) to (318, 207) then Draws a cyan circle centered at (294, 95) with radius 72.
; PLAN: r0=28(x), r1=105(y), r2=11(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x1), r6=38(y1), r7=318(x2), r8=207(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=294(x), r11=95(y), r12=72(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 28
LDI r1, 105
LDI r2, 11
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 38
LDI r7, 318
LDI r8, 207
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 294
LDI r11, 95
LDI r12, 72
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
