; DESCRIPTION: Composite: Creates a cyan circular shape at (113, 175) with radius 19 then Draws a white line from (42, 250) to (72, 117) then Draws a blue rectangle at (139, 128) with width 16 and height 17.
; PLAN: r0=113(x), r1=175(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x1), r6=250(y1), r7=72(x2), r8=117(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=139(x), r11=128(y), r12=16(width), r13=17(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 175
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 250
LDI r7, 72
LDI r8, 117
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 139
LDI r11, 128
LDI r12, 16
LDI r13, 17
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
