; DESCRIPTION: Composite: Places a red dot at position (491, 72) then Draws a purple rectangle at (316, 136) with width 28 and height 94 then Places a cyan line segment connecting (281, 197) to (243, 206).
; PLAN: r0=491(x), r1=72(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=316(x), r6=136(y), r7=28(width), r8=94(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=281(x1), r11=197(y1), r12=243(x2), r13=206(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 491
LDI r1, 72
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 316
LDI r6, 136
LDI r7, 28
LDI r8, 94
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 197
LDI r12, 243
LDI r13, 206
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
