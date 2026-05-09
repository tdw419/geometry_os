; DESCRIPTION: Composite: Creates a black circular shape at (284, 186) with radius 23 then Places a yellow dot at position (342, 192) then Draws a orange rectangle at (133, 204) with width 99 and height 46.
; PLAN: r0=284(x), r1=186(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x), r6=192(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=133(x), r11=204(y), r12=99(width), r13=46(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 186
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 192
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 133
LDI r11, 204
LDI r12, 99
LDI r13, 46
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
