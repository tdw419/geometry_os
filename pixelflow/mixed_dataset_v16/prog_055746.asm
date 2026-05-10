; DESCRIPTION: Composite: Draws a green rectangle at (97, 114) with width 113 and height 81 then Places a magenta dot at position (174, 163) then Draws a yellow line from (49, 74) to (104, 248).
; PLAN: r0=97(x), r1=114(y), r2=113(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x), r6=163(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=49(x1), r11=74(y1), r12=104(x2), r13=248(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 97
LDI r1, 114
LDI r2, 113
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 163
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 49
LDI r11, 74
LDI r12, 104
LDI r13, 248
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
