; DESCRIPTION: Composite: Renders a purple line between points (461, 72) and (327, 83) then Draws a green circle centered at (159, 50) with radius 43 then Places a black 120x107 rectangle at position (59, 94).
; PLAN: r0=461(x1), r1=72(y1), r2=327(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=50(y), r7=43(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=59(x), r11=94(y), r12=120(width), r13=107(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 72
LDI r2, 327
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 50
LDI r7, 43
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 59
LDI r11, 94
LDI r12, 120
LDI r13, 107
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
