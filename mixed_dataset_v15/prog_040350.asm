; DESCRIPTION: Composite: Draws a blue line from (36, 41) to (471, 247) then Renders a orange disk with center (245, 99) and radius 43 then Places a black 93x62 rectangle at position (309, 187).
; PLAN: r0=36(x1), r1=41(y1), r2=471(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=99(y), r7=43(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=309(x), r11=187(y), r12=93(width), r13=62(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 41
LDI r2, 471
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 99
LDI r7, 43
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 309
LDI r11, 187
LDI r12, 93
LDI r13, 62
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
