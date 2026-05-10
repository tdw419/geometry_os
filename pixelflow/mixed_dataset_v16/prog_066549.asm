; DESCRIPTION: Composite: Draws a orange line from (70, 26) to (179, 184) then Renders a yellow disk with center (395, 209) and radius 25 then Places a blue 76x89 rectangle at position (159, 142).
; PLAN: r0=70(x1), r1=26(y1), r2=179(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=209(y), r7=25(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=159(x), r11=142(y), r12=76(width), r13=89(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 70
LDI r1, 26
LDI r2, 179
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 209
LDI r7, 25
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 159
LDI r11, 142
LDI r12, 76
LDI r13, 89
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
