; DESCRIPTION: Composite: Draws a white circle centered at (146, 72) with radius 43 then Draws a yellow line from (484, 182) to (199, 195) then Places a magenta 114x113 rectangle at position (234, 82).
; PLAN: r0=146(x), r1=72(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=484(x1), r6=182(y1), r7=199(x2), r8=195(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=234(x), r11=82(y), r12=114(width), r13=113(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 146
LDI r1, 72
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 484
LDI r6, 182
LDI r7, 199
LDI r8, 195
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 82
LDI r12, 114
LDI r13, 113
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
