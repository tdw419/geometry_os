; DESCRIPTION: Composite: Renders a orange line between points (471, 132) and (509, 197) then Places a green 36x40 rectangle at position (355, 180) then Creates a yellow circular shape at (404, 128) with radius 44.
; PLAN: r0=471(x1), r1=132(y1), r2=509(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=180(y), r7=36(width), r8=40(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=404(x), r11=128(y), r12=44(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 471
LDI r1, 132
LDI r2, 509
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 180
LDI r7, 36
LDI r8, 40
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 404
LDI r11, 128
LDI r12, 44
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
