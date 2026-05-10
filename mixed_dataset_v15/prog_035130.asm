; DESCRIPTION: Composite: Creates a white circular shape at (267, 99) with radius 65 then Places a green 104x40 rectangle at position (52, 176) then Draws a orange line from (455, 204) to (82, 249).
; PLAN: r0=267(x), r1=99(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=52(x), r6=176(y), r7=104(width), r8=40(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=455(x1), r11=204(y1), r12=82(x2), r13=249(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 99
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 52
LDI r6, 176
LDI r7, 104
LDI r8, 40
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 455
LDI r11, 204
LDI r12, 82
LDI r13, 249
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
