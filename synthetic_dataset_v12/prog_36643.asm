; DESCRIPTION: Composite: Draws a yellow line from (199, 143) to (375, 239) then Places a green dot at position (368, 54) then Draws a red rectangle at (494, 57) with width 11 and height 93.
; PLAN: r0=199(x1), r1=143(y1), r2=375(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=54(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=494(x), r11=57(y), r12=11(width), r13=93(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 199
LDI r1, 143
LDI r2, 375
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 54
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 494
LDI r11, 57
LDI r12, 11
LDI r13, 93
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
