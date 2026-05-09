; DESCRIPTION: Composite: Places a cyan line segment connecting (329, 119) to (269, 42) then Draws a green rectangle at (124, 18) with width 108 and height 28 then Renders a orange disk with center (319, 173) and radius 70.
; PLAN: r0=329(x1), r1=119(y1), r2=269(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=124(x), r6=18(y), r7=108(width), r8=28(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=319(x), r11=173(y), r12=70(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 329
LDI r1, 119
LDI r2, 269
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 18
LDI r7, 108
LDI r8, 28
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 173
LDI r12, 70
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
