; DESCRIPTION: Composite: Places a white circle of radius 21 at center (191, 206) then Draws a orange line from (184, 204) to (46, 49) then Places a white 106x114 rectangle at position (270, 26).
; PLAN: r0=191(x), r1=206(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x1), r6=204(y1), r7=46(x2), r8=49(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=270(x), r11=26(y), r12=106(width), r13=114(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 206
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 204
LDI r7, 46
LDI r8, 49
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 26
LDI r12, 106
LDI r13, 114
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
