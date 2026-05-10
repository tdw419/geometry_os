; DESCRIPTION: Composite: Places a green dot at position (167, 121) then Draws a green line from (314, 195) to (63, 221) then Draws a white rectangle at (402, 46) with width 22 and height 101.
; PLAN: r0=167(x), r1=121(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=314(x1), r6=195(y1), r7=63(x2), r8=221(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=402(x), r11=46(y), r12=22(width), r13=101(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 121
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 314
LDI r6, 195
LDI r7, 63
LDI r8, 221
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 402
LDI r11, 46
LDI r12, 22
LDI r13, 101
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
