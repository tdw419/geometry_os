; DESCRIPTION: Composite: Draws a orange circle centered at (228, 58) with radius 54 then Places a yellow 67x45 rectangle at position (158, 194) then Draws a green line from (456, 236) to (498, 146).
; PLAN: r0=228(x), r1=58(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=158(x), r6=194(y), r7=67(width), r8=45(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=456(x1), r11=236(y1), r12=498(x2), r13=146(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 228
LDI r1, 58
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 158
LDI r6, 194
LDI r7, 67
LDI r8, 45
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 236
LDI r12, 498
LDI r13, 146
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
