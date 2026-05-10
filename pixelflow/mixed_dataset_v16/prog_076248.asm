; DESCRIPTION: Composite: Places a cyan line segment connecting (493, 6) to (17, 241) then Places a red dot at position (491, 142) then Draws a yellow rectangle at (151, 70) with width 82 and height 72.
; PLAN: r0=493(x1), r1=6(y1), r2=17(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=491(x), r6=142(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=151(x), r11=70(y), r12=82(width), r13=72(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 493
LDI r1, 6
LDI r2, 17
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 491
LDI r6, 142
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 151
LDI r11, 70
LDI r12, 82
LDI r13, 72
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
