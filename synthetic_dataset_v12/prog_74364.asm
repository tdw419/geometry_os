; DESCRIPTION: Composite: Draws a orange circle centered at (84, 164) with radius 61 then Draws a yellow line from (509, 189) to (296, 94) then Places a green 61x33 rectangle at position (391, 143).
; PLAN: r0=84(x), r1=164(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=509(x1), r6=189(y1), r7=296(x2), r8=94(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=391(x), r11=143(y), r12=61(width), r13=33(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 84
LDI r1, 164
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 509
LDI r6, 189
LDI r7, 296
LDI r8, 94
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 143
LDI r12, 61
LDI r13, 33
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
