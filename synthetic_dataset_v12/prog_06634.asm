; DESCRIPTION: Composite: Places a yellow dot at position (43, 16) then Draws a yellow line from (172, 121) to (404, 246) then Places a magenta 38x23 rectangle at position (207, 26).
; PLAN: r0=43(x), r1=16(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=172(x1), r6=121(y1), r7=404(x2), r8=246(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=207(x), r11=26(y), r12=38(width), r13=23(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 43
LDI r1, 16
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 172
LDI r6, 121
LDI r7, 404
LDI r8, 246
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 26
LDI r12, 38
LDI r13, 23
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
