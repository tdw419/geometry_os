; DESCRIPTION: Composite: Creates a magenta circular shape at (210, 140) with radius 67 then Draws a black line from (270, 88) to (110, 205) then Places a orange 55x13 rectangle at position (303, 204).
; PLAN: r0=210(x), r1=140(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=270(x1), r6=88(y1), r7=110(x2), r8=205(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=303(x), r11=204(y), r12=55(width), r13=13(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 140
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 270
LDI r6, 88
LDI r7, 110
LDI r8, 205
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 204
LDI r12, 55
LDI r13, 13
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
