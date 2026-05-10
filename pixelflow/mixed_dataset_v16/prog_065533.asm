; DESCRIPTION: Composite: Draws a blue rectangle at (359, 42) with width 98 and height 27 then Draws a white line from (150, 29) to (363, 66) then Creates a orange circular shape at (239, 84) with radius 33.
; PLAN: r0=359(x), r1=42(y), r2=98(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x1), r6=29(y1), r7=363(x2), r8=66(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=239(x), r11=84(y), r12=33(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 359
LDI r1, 42
LDI r2, 98
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 29
LDI r7, 363
LDI r8, 66
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 84
LDI r12, 33
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
